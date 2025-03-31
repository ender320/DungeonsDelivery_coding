extends CharacterBody2D

var speed = 400

func _ready():
	if Dialogic.VAR.intro == true:
		Dialogic.start("dialogo_introdução")
	pass

func _process(delta):
	if Dialogic.VAR.lendo == true:
		speed = 0
	else:
		speed = 400

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
		velocity.x = 0
	else:
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
