extends CharacterBody2D
var speed = 60
var agressive_state = false #idle
var player 
var dialogic_start = true

func _physics_process(delta):
	if agressive_state == true: #isso aqui vai fazer com que o noll vá átras do player!
		position += (player.position - position)/speed #isso aqui faz seguir
		$detec_zone/MeshInstance2D.visible = false
		play_anim(1)
	if agressive_state == false:
		play_anim(0)
func _on_detec_zone_body_entered(body):
	player = body #player vai ser o corpo que vai entrar dentro da area de colisão
	if dialogic_start == true:
		Dialogic.start("inimigo")
		dialogic_start = false
		await Dialogic.timeline_ended
		agressive_state = true
		#$MeshInstance2D.visible = false
	if dialogic_start == false:
		agressive_state = true


func _on_hitbox_area_entered(area):
	pass # Replace with function body.


func _on_detec_zone_body_exited(body):
	player = body
	agressive_state = false

func play_anim(movement):
	var anim = $AnimatedSprite_enemy
	if movement == 1:
		anim.play("agressivo")
	elif movement == 0:
		anim.play("idle")
