class_name scene_handler extends Node

@onready var gui: Control = $gui;
@onready var world_2d: Node2D = $world_2d;
@onready var world_3d: Node3D = $world_3d;

var curr_scene: Node

func _ready():
	alnestan.scenes = self;

	load_scene("main_menu", "gui");

func unload_scene():
	if is_instance_valid(curr_scene):
		curr_scene.queue_free();

	curr_scene = null;


func load_scene(scene: String, frame: String):
	unload_scene();

	var res_path: String = "res://scenes/%s.tscn" % scene;
	var res := load(res_path);
	var frame_node: Node = _find_frame(frame);

	if (res):
		curr_scene = res.instantiate();
		frame_node.add_child(curr_scene);	


func _find_frame(label: String):
	if label == "gui":
		return gui;
	elif label == "2d":
		return world_2d;
	elif label == "3d":
		return world_3d;


func _on_transition_screen_transitioned() -> void:
	pass # Replace with function body.
