extends CharacterBody2D

var speed = 400
var vida = 1

func _ready():
	if Dialogic.VAR.intro == true:
		Dialogic.start("dialogo_introdução")
	

func _process(delta):
	if Dialogic.VAR.lendo == true:
		speed = 0
	else:
		speed = 400
	if vida == 0:
		get_tree().reload_current_scene()

func _physics_process(delta):
	movimentação_vertical()
	#movimentação_top_down()


func _on_hurtbox_area_entered(area):
	if area.name == "hitbox":
		vida -= 1

func movimentação_top_down():
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
	pass

func movimentação_vertical():
	var direção = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	if direção:
		velocity = direção * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
