class_name scene_handler extends Node

@onready var gui: Control = $gui
@onready var non_interruptive_gui: Control = $non_interruptive_gui
@onready var world_2d: Node2D = $world_2d
@onready var world_3d: Node3D = $world_3d

var curr_scene: Node
var current: String
var curr_scene_is_non_interruptive = false


func _ready():
	alnestan.scenes = self

	non_interruptive_gui.visible = false
	load_scene("main_menu", alnestan.FRAMES.GUI)


func unload_scene():
	if is_instance_valid(curr_scene):
		curr_scene.queue_free()

	if curr_scene_is_non_interruptive:
		non_interruptive_gui.visible = false
		curr_scene_is_non_interruptive = false

	curr_scene = null


func load_scene(scene: String, frame: String, is_new_parent: bool = true):
	var res_path: String = "res://scenes/%s.tscn" % scene
	var res := load(res_path)
	var frame_node: Node = _find_frame(frame)

	assert(res, "error: invalid path: %s" % res)

	if frame != alnestan.FRAMES.GUI_NI:
		unload_scene()
	else:
		non_interruptive_gui.visible = true
		curr_scene_is_non_interruptive = true

	curr_scene = res.instantiate()
	frame_node.add_child(curr_scene)

	if is_new_parent:
		current = scene


func _find_frame(label: String):
	var frame = null

	match label:
		"gui":
			frame = gui
		"gui_ni":
			frame = non_interruptive_gui
		"2d":
			frame = world_2d
		"3d":
			frame = world_3d

	assert(frame != null, "error: invalid scene frame: %s" % label)

	return frame
