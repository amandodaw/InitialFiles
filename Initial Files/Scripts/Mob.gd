extends RigidBody2D

func _on_Area2D_body_entered(body):
	if body != self:
		queue_free()


func _on_Area2D_area_entered(area):
	queue_free()
