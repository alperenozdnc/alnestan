extends Control

func _ready():
	var fullscreen_or_windowed: OptionButton = %fullscreen_or_windowed;

	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		fullscreen_or_windowed.selected = 0;
	else:
		fullscreen_or_windowed.selected = 1;


func _on_button_go_back_pressed() -> void:
	alnestan.scenes.load_scene("settings_menu", "gui");


func _on_fullscreen_or_windowed_item_selected(idx: int) -> void:
	if idx == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN);
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);



func _on_option_button_item_selected(idx: int) -> void:
	match idx:
		0:
			get_window().size = Vector2i(1920, 1080);
		1:
			get_window().size = Vector2i(1280, 720);
		2:
			get_window().size = Vector2i(1024, 768);
		2:
			get_window().size = Vector2i(800, 600);

