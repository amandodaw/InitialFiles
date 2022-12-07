extends Node

onready var menu2_scene = load("res://Scenes/Menu2.tscn")
onready var menu_scene = load("res://Scenes/Menu.tscn")

onready var mob_scene = load("res://Scenes/Mob.tscn")

var hp = 1
var difficulty = 1
var mob_velocity = Vector2(150.0, 250.0)

func _ready():
	yield(get_tree().create_timer(3.0), "timeout")
	$Message.hide()

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = true
		var menu = menu2_scene.instance()
		add_child(menu)

func _on_MobTimer_timeout():
	if difficulty >= 5:
		difficulty = 0
		mob_velocity += Vector2(0.5, 0.5)
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instance()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randi()
	
	var direction = Vector2(1,0)

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Choose the velocity for the mob.
	var velocity = Vector2(rand_range(mob_velocity.x, mob_velocity.y), 0.0)
	mob.linear_velocity = direction * velocity

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
	
	difficulty += 1

func get_hit():
	hp -= 1
	if hp <= 0:
		game_over()
	$HPLabel.text = "HP: " + str(hp)

func game_over():
	get_tree().change_scene_to(menu_scene)
