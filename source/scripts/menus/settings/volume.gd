extends Control

const MASTER_VOLUME_BUS = 0;

func _ready():
	var master_volume_slider: HSlider = %master;
	var sfx_volume_slider: HSlider = %sfx;
	var bgm_volume_slider: HSlider = %bgm;

	master_volume_slider.value = AudioServer.get_bus_volume_db(MASTER_VOLUME_BUS);
	sfx_volume_slider.value = alnestan.audio.sfx.volume_db;
	bgm_volume_slider.value = alnestan.audio.bgm.volume_db;


func _on_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MASTER_VOLUME_BUS, value);

	if value == -40:
		AudioServer.set_bus_mute(MASTER_VOLUME_BUS, true);
	else:
		AudioServer.set_bus_mute(MASTER_VOLUME_BUS, false);


func _on_sfx_value_changed(value: float) -> void:
	alnestan.audio.sfx.set_volume(value);


func _on_bgm_value_changed(value: float) -> void:
	alnestan.audio.bgm.set_volume(value);


func _on_button_go_back_pressed() -> void:
	alnestan.scenes.load_scene("settings_menu", "gui");
