class_name sfx_node extends AudioStreamPlayer

var current_stream: String;

func _ready() -> void:
	alnestan.audio.sfx = self;
	self.volume_db = alnestan.settings["audio_level"]["sfx"];

func play_stream(filename: String):
	var path := "res://sounds/sfx/%s.mp3" % filename;

	if not ResourceLoader.exists(path):
		push_error("%s sound file does not exist on disk", path);
		return;

	self.stream = load(path);
	self.play();


func stop_stream():
	self.stream_paused = true;


func set_tempo(n: float = 1):
	self.pitch_scale = n;


func set_volume(n: float):
	self.volume_db = n;
	alnestan.settings["audio_level"]["sfx"] = n;
