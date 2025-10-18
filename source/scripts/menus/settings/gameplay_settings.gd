extends Control

@onready var text_speed: HSlider = %text_speed_slider
@onready var gui_size: HSlider = %gui_size_slider


func _ready():
	print(alnestan.settings["gameplay"])

	text_speed.value = alnestan.settings["gameplay"]["text_speed"]
	gui_size.value = alnestan.settings["gameplay"]["gui_size"]


func _on_button_go_back_pressed() -> void:
	alnestan.scenes.load_scene("settings_menu", alnestan.FRAMES.GUI)


func _on_gui_size_changed(value: float) -> void:
	alnestan.settings["gameplay"]["gui_size"] = value


func _on_text_speed_changed(value: float) -> void:
	alnestan.settings["gameplay"]["text_speed"] = value
