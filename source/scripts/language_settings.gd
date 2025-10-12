extends Control

@onready var turkish_button = %turkish;
@onready var english_button = %english;

@onready var button_to_language_map = {
	"turkish": turkish_button,
	"english": english_button,
};

func _ready():
	if !alnestan.language:
		alnestan.language = "turkish";

	button_to_language_map[alnestan.language].grab_focus();


func _on_english_pressed() -> void:
	alnestan.language = "english";


func _on_turkish_pressed() -> void:
	alnestan.language = "turkish";


func _on_button_go_back_pressed() -> void:
	alnestan.scenes.load_scene("settings_menu", "gui")
