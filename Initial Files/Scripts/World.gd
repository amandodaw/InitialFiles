extends Node

onready var mob_scene = load("res://Scenes/Mob.tscn")
var hp = 100

func _on_MobTimer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instance()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randi()
	
	var direction = Vector2(1,0)

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Choose the velocity for the mob.
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = direction * velocity

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)

func get_hit():
	hp -= 1
	$HPLabel.text = "HP: " + str(hp)
