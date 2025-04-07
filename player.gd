extends CharacterBody2D

var speed = 300
var vida = 1
var current_dir = "none"

func _ready():
	$AnimatedSprite2D.play("idle_cima")
	if Dialogic.VAR.intro == true:
		Dialogic.start("dialogo_introdução")
	

func _process(delta):
	if Dialogic.VAR.lendo == true:
		speed = 0
	else:
		speed = 300
	if vida == 0:
		get_tree().reload_current_scene()

func _physics_process(delta):
	movimentação_vertical()
	#movimentação_top_down()
	move_and_slide()

func _on_hurtbox_area_entered(area):
	if area.name == "hitbox":
		vida -= 1

func movimentação_top_down():
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0

func movimentação_vertical():
	var direção = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	if direção:
		velocity = direção * speed
	else:
		velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
	elif  Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
	else:
		play_anim(0)
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("andando_lado")
		elif movement == 0:
			anim.play("idle_lado")

	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("andando_lado")
		elif movement == 0:
			anim.play("idle_lado")

	if dir == "up":
		if movement == 1:
			anim.play("andando_cima")
		elif movement == 0:
			anim.play("idle_cima")

	if dir == "down":
		if movement == 1:
			anim.play("andando_baixo")
		elif movement == 0:
			anim.play("idle_baixo")
	
