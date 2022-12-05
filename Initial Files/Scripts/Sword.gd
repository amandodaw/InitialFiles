extends Area2D


func _ready():
	$AnimationPlayer.play("Attack")

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
