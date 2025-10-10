extends Control

func _ready() -> void:
	var button_actions = [
		[%button_continue, _continue_game],
		[%button_new_game, _start_new_game],
		[%button_settings, _show_settings],
		[%button_exit, _exit_game]
	];

	for n in range(button_actions.size()):
		var button = button_actions[n][0];
		var action = button_actions[n][1];

		button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND;
		button.mouse_entered.connect(_hover_action);	
		button.pressed.connect(action);	


func _hover_action() -> void:
	%hover_sound.play();


func _continue_game() -> void:
	alnestan.transitioner.transition();
	await alnestan.transitioner.transitioned;

	alnestan.scenes.load_scene("test", "3d");


func _start_new_game() -> void:
	alnestan.transitioner.transition();
	await alnestan.transitioner.transitioned;

	alnestan.scenes.load_scene("test", "3d");

	
func _show_settings() -> void:
	alnestan.transitioner.transition();


func _exit_game() -> void:
	get_tree().quit();
