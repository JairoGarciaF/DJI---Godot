extends RigidBody2D

func _ready():
	print('Dentro de ready')
	#va disminuyendo la velocidad con el tiempo
	#apply_force(Vector2(500, 600))
	#se impulsa constantemente
	#apply_impulse(Vector2(200, 100))

func _process(delta):
	#print(Engine.get_frames_per_second())
	pass

func _physics_process(delta):
	#apply_force(Vector2(50, 0))
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2(200, 0))
	elif Input.is_action_pressed("move_up"):
		apply_force(Vector2(0, -200))
	elif Input.is_action_pressed("move_left"):
		apply_force(Vector2(-200, 0))
	elif Input.is_action_pressed("move_down"):
		apply_force(Vector2(0, 200))
