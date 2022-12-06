extends RigidBody2D
signal damage

func _ready():
	connect("damage", get_parent(), "get_hit")
	connect("damage", get_parent().get_node("Player"), "sword_increment")

func _on_Area2D_body_entered(body):
	if body != self:
		queue_free()


func _on_Area2D_area_entered(area):
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("damage")
	queue_free()
