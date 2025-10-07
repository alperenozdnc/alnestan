extends Control


func _ready() -> void:
	_watch_button_clicks();


func _watch_button_clicks() -> void:
	var continue_button = %button_continue;
	var new_game_button = %button_new_game;
	var settings_button = %button_settings;
	var exit_button = %button_exit;

	continue_button.pressed.connect(_continue_game);
	new_game_button.pressed.connect(_start_new_game);
	settings_button.pressed.connect(_show_settings);
	exit_button.pressed.connect(_exit_game);


func _continue_game() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn");


func _start_new_game() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn");

	
func _show_settings() -> void:
	print("showing settings...");


func _exit_game() -> void:
	get_tree().quit();
