extends Area2D

export(PackedScene) onready var mob_scene
onready var sword_scene = load("res://Scenes/Sword.tscn")

var speed = 400
var sword_scale = Vector2(1,1)

func _ready():
	position = get_viewport_rect().size/2

func _process(delta):
	movement(delta)
	control()

func control():
	if Input.is_action_just_pressed("d"):
		var sword = sword_scene.instance()
		sword.position = Vector2(sword.position.x-16, sword.position.y)
		sword.scale = sword_scale
		add_child(sword)

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

func sword_increment():
	if sword_scale >= Vector2( 5, 5):
		return
	sword_scale += Vector2(0.1, 0.1)
