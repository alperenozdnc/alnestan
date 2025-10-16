extends Node

var SCREEN_SIZES = [
	Vector2i(1920, 1080),
	Vector2i(1280, 720),
	Vector2i(1024, 768),
	Vector2i(800, 600)
];

var GRAPHICS_SETTINGS = {
	"VERY_LOW": 4,
	"LOW": 3,
	"NORMAL": 2,
	"HIGH": 1,
	"VERY_HIGH": 0
};

var settings := {
	"language": "turkish",
	"audio_level": {
		"master": AudioServer.get_bus_volume_db(0),
		"bgm": 0.0,
		"sfx": 0.0
	},
	"gameplay": {
		"text_speed": 0.0,
		"gui_size": 1.0
	},
	"video": {
		"brightness": 100.0,
		"window_size": Vector2i(1920, 1080),
		"screen_type": DisplayServer.WINDOW_MODE_FULLSCREEN,
		"graphics_quality": GRAPHICS_SETTINGS.VERY_HIGH
	}
};

var language: String = "turkish";
var paused: bool = false;

var scenes: scene_handler;
var transitioner: transition_screen;

var player: game_player;

var keybindings = {
	"left": "move_left",
	"right": "move_right",
	"forward": "move_forward",
	"back": "move_back",
	"jump": "ui_accept",
	"sprint": "sprint",
};

var audio: Dictionary = {};
