class_name audio_manager extends AudioStreamPlayer

var current_stream: String;

func _ready() -> void:
	alnestan.audio = self;

func play_sound(filename: String):
	var path := "res://sounds/%s.mp3" % filename;

	if not ResourceLoader.exists(path):
		push_error("%s sound file does not exist on disk", path);
		return;

	self.stream = load(path);
	self.play();
