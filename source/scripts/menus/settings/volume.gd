extends Control

const MASTER_VOLUME_BUS = 0;
const MASTER_MUTE_LIMIT = -40;

func _ready():
	var master_volume_slider: HSlider = %master;
	var sfx_volume_slider: HSlider = %sfx;
	var bgm_volume_slider: HSlider = %bgm;
	var master_audio_level: float = alnestan.settings["audio_level"]["master"];

	_mute_master_if_limit(master_audio_level);

	master_volume_slider.value = master_audio_level;
	sfx_volume_slider.value = alnestan.settings["audio_level"]["sfx"];
	bgm_volume_slider.value = alnestan.settings["audio_level"]["bgm"];


func _on_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MASTER_VOLUME_BUS, value);
	_mute_master_if_limit(value);

	alnestan.settings["audio_level"]["master"] = value;


func _on_sfx_value_changed(value: float) -> void:
	alnestan.audio.sfx.set_volume(value);


func _on_bgm_value_changed(value: float) -> void:
	alnestan.audio.bgm.set_volume(value);


func _on_button_go_back_pressed() -> void:
	alnestan.scenes.load_scene("settings_menu", "gui");


func _mute_master_if_limit(value: float):
	AudioServer.set_bus_mute(MASTER_VOLUME_BUS, value == MASTER_MUTE_LIMIT);
