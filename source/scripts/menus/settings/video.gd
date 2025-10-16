extends Control

func _ready():
	%brightness.value = alnestan.settings.video.brightness;
	%window_size.selected = alnestan.SCREEN_SIZES.find(
		alnestan.settings.video.window_size
	);

	if alnestan.settings.video.screen_type == DisplayServer.WINDOW_MODE_FULLSCREEN:
		%fullscreen_or_windowed.selected = 0;
	else:
		%fullscreen_or_windowed.selected = 1;

	%graphics_quality.selected = alnestan.settings.video.graphics_quality;


func _on_button_go_back_pressed():
	alnestan.scenes.load_scene("settings_menu", "gui");


func _on_fullscreen_or_windowed_item_selected(idx: int):
	if idx == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN);
		alnestan.settings.video.screen_type = DisplayServer.WINDOW_MODE_FULLSCREEN;
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
		alnestan.settings.video.screen_type = DisplayServer.WINDOW_MODE_WINDOWED;


func _on_option_button_item_selected(idx: int):
	get_window().size = alnestan.SCREEN_SIZES[idx];
	alnestan.settings.video.window_size = alnestan.SCREEN_SIZES[idx];


func _on_graphics_quality_item_selected(idx: int):
	for key in alnestan.GRAPHICS_SETTINGS.keys():
		var value = alnestan.GRAPHICS_SETTINGS[key];

		if idx != value:
			continue

		alnestan.settings.video.graphics_quality = value;


func _on_brightness_value_changed(value: float):
	alnestan.settings.video.brightness = value;
