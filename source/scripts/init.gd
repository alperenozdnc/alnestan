extends Node

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
