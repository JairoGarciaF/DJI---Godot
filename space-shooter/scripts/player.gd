extends CharacterBody2D

@export var speed = 300

var rocket_scene 
#var rocket_container
#@onready var rocket_container = get_node("Rocket Container")
@onready var rocket_container = $"Rocket Container"

signal took_damage

func _ready():
	rocket_scene = preload("res://scenes/rocket.tscn")
	#rocket_container = get_node("Rocket Container")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var rocket_instance = rocket_scene.instantiate()
	#rocket_instance.global_position.x += 50
	#add_child(rocket_instance)
	
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 50
	
func _physics_process(delta):
#	velocity = Vector2(speed, 0)
#	move_and_slide()
	
	if Input.is_action_pressed("move_up"):
		velocity =Vector2(0, -speed)
	if Input.is_action_pressed("move_down"):
		velocity =Vector2(0, speed)
	if Input.is_action_pressed("move_left"):
		velocity =Vector2(-speed, 0)
	if Input.is_action_pressed("move_right"):
		velocity =Vector2(speed, 0)
	move_and_slide()
	
	#codigo para que la nave no se sobrepase de la pantalla
	var size = get_viewport_rect().size
	
	global_position.x = clampf(global_position.x, 0, size.x)
	global_position.y = clampf(global_position.y, 0, size.y)
	
func take_damage():
	emit_signal("took_damage")
	
func die():
	queue_free()
