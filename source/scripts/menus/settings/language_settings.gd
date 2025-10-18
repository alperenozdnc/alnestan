extends Control

@onready var turkish_button = %turkish;
@onready var english_button = %english;
@onready var button_to_language_map = {
	"turkish": turkish_button,
	"english": english_button,
};

func _ready():
	button_to_language_map[alnestan.settings["language"]].grab_focus();


func _on_english_pressed() -> void:
	alnestan.settings["language"] = "english";


func _on_turkish_pressed() -> void:
	alnestan.settings["language"] = "turkish";


func _on_button_go_back_pressed() -> void:
	alnestan.scenes.load_scene("settings_menu", alnestan.FRAMES.GUI);
