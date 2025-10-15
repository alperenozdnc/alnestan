extends Control

@onready var animation: AnimationPlayer = %animation;

const BLACKLIST = ["main_menu", "settings_menu"];


func _ready():
	animation.play("RESET");
	self.visible = false;


func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused:
			resume();
		else:
			pause();


func resume():
	self.visible = false;
	get_tree().paused = false;

	animation.play_backwards("blur");

	if alnestan.player and alnestan.scenes.current == "test":
		alnestan.player.capture_mouse();	


func pause():
	if BLACKLIST.has(alnestan.scenes.current):
		return;

	self.visible = true;
	get_tree().paused = true;
	alnestan.paused = true;

	animation.play("blur");


func _on_resume_pressed():
	resume();


func _on_settings_pressed() -> void:
	await alnestan.scenes.load_scene("settings_menu", "gui");
	resume();


func _on_menu_pressed() -> void:
	alnestan.scenes.load_scene("main_menu", "gui");
	resume();


func _on_exit_pressed() -> void:
	get_tree().quit();
