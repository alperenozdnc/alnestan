extends Control

func _ready() -> void:
	alnestan.audio.bgm.play_stream("background");

	var button_actions = [
		[%button_continue, _continue_game],
		[%button_new_game, _start_new_game],
		[%button_settings, _show_settings],
		[%button_exit, _exit_game]
	];

	for n in range(button_actions.size()):
		var button = button_actions[n][0];
		var click_action = func():
			await _default_click_action();

			button_actions[n][1].call();

		button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND;
		button.mouse_entered.connect(_hover_action);	
		button.pressed.connect(click_action);	


func _default_click_action() -> void:
	alnestan.audio.sfx.play_stream("click");

	alnestan.transitioner.transition();
	await alnestan.transitioner.transitioned;

	alnestan.audio.bgm.stop_stream();
	

func _hover_action() -> void:
	alnestan.audio.sfx.play_stream("paper");


func _continue_game() -> void:
	alnestan.scenes.load_scene("test", "3d");


func _start_new_game() -> void:
	alnestan.scenes.load_scene("test", "3d");

	
func _show_settings() -> void:
	print("settings");


func _exit_game() -> void:
	get_tree().quit();
