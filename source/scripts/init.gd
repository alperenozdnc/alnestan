extends Node3D

var interpreter = ProjectSettings.globalize_path("res://scripts/venv/bin/python3");
var script_path = ProjectSettings.globalize_path("res://scripts/main.py");

func _ready():
	OS.execute(interpreter, [script_path]);
