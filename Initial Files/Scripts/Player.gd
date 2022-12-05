extends Area2D

export(PackedScene) onready var mob_scene

var speed = 400

func _ready():
	position = get_viewport_rect().size/2

func _process(delta):
	movement(delta)
	control()

func control():
	if Input.is_action_just_pressed("d"):
		print("D pressed")
		summon()

func movement(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta


func summon():
	var mob = mob_scene.instance()
	mob.position = Vector2(position.x, position.y)
	print(position, mob.position)
	add_child(mob)
