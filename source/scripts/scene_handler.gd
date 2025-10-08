extends Node

var current_scene = null;

func _ready() -> void:
	var root = get_tree().root;
	current_scene = root.get_child(root.get_child_count() - 1);

func switch_scene(path) -> void:
	call_deferred("_deferred_switch_scene", path);	

func _deferred_switch_scene(path):
	current_scene.free();

	var scene = load(path);
	current_scene = scene.instantiate();
	get_tree().root.add_child(current_scene);
	get_tree().current_scene = current_scene ;
