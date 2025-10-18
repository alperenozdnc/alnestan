extends Control


func _ready() -> void:
	var button_actions = [
		[%button_audio, _show_audio_menu],
		[%button_video, _show_video_menu],
		[%button_gameplay, _show_gameplay_menu],
		[%button_lang, _show_language_menu],
		[%button_go_back, _go_back]
	]

	for n in range(button_actions.size()):
		var button: Button = button_actions[n][0]
		var click_action = func():
			await _default_click_action(button.name == "button_go_back")

			button_actions[n][1].call()

		button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		button.mouse_entered.connect(_hover_action)
		button.pressed.connect(click_action)


func _default_click_action(transition: bool = false) -> void:
	alnestan.audio.sfx.play_stream("click")

	if transition:
		alnestan.transitioner.transition()
		await alnestan.transitioner.transitioned


func _hover_action() -> void:
	alnestan.audio.sfx.play_stream("paper")


func _show_audio_menu() -> void:
	alnestan.scenes.load_scene("audio_settings", alnestan.FRAMES.GUI, false)


func _show_video_menu() -> void:
	alnestan.scenes.load_scene("video_settings", alnestan.FRAMES.GUI, false)


func _show_gameplay_menu() -> void:
	alnestan.scenes.load_scene("gameplay_settings", alnestan.FRAMES.GUI, false)


func _show_language_menu() -> void:
	alnestan.scenes.load_scene("language_settings", alnestan.FRAMES.GUI, false)


func _go_back() -> void:
	if alnestan.paused:
		alnestan.scenes.unload_scene()
	else:
		alnestan.scenes.load_scene("main_menu", alnestan.FRAMES.GUI)
