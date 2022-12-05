extends RigidBody2D



func _on_Mob_body_entered(body):
	queue_free()
