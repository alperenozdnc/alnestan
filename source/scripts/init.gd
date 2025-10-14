extends Node

var language: String = "turkish";
var paused: bool = false;

var scenes: scene_handler;
var transitioner: transition_screen;

var player: game_player;

var audio: Dictionary = {};
var sfx: sfx_node;
var bgm: bgm_node;
