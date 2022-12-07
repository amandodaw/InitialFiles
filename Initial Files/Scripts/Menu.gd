extends CanvasLayer


func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/World.tscn")

func _on_Button2_pressed():
	get_tree().quit()

func _on_Button3_pressed():
	get_tree().paused = false;
	queue_free()
