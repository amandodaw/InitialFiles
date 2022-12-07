extends RigidBody2D
signal damage
signal sword_increment

func _ready():
	randomize()
	$AnimatedSprite.frame = randi() % $AnimatedSprite.frames.get_frame_count("default")
	connect("damage", get_parent(), "get_hit")
	connect("sword_increment", get_parent().get_node("Player"), "sword_increment")

func _on_Area2D_area_entered(_area):
	emit_signal("sword_increment")
	queue_free()
	print(3)
	yield(get_tree().create_timer(1.0), "timeout")
	print(2)
	yield(get_tree().create_timer(1.0), "timeout")
	print(1)
	yield(get_tree().create_timer(1.0), "timeout")





func _on_VisibilityNotifier2D_screen_exited():
	if is_queued_for_deletion():
		return
	emit_signal("damage")
	queue_free()
