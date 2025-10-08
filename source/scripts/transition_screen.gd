extends CanvasLayer

signal transitioned;

func transition():
	$color_rect.visible = true;
	$animation_player.play("fade_to_black");


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("transitioned");
		$animation_player.play("fade_to_normal");
	if anim_name == "fade_to_normal":
		print("fading to normal from black");
		$color_rect.visible = false;
