class_name transition_screen extends CanvasLayer

signal transitioned;

func _ready() -> void:
	alnestan.transitioner = self;


func transition():
	$color_rect.visible = true;
	$animation_player.play("fade_to_black");


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("transitioned");
		$animation_player.play("fade_to_normal");
	if anim_name == "fade_to_normal":
		$color_rect.visible = false;
