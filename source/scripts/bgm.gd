class_name bgm_node extends AudioStreamPlayer

var current_stream: String;

func _ready() -> void:
	alnestan.audio.bgm = self;

func play_stream(filename: String):
	var path := "res://sounds/bg/%s.mp3" % filename;

	if not ResourceLoader.exists(path):
		push_error("%s sound file does not exist on disk", path);
		return;

	self.stream = load(path);
	self.play();


func stop_stream():
	var tween := create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_SINE);
	var duration_sec = 2.00;
	var final_value = -80;

	tween.tween_property(self, "volume_db", final_value, duration_sec);


func set_tempo(n: float = 1):
	self.pitch_scale = n;


func set_volume(n: float):
	self.volume_db = n;
