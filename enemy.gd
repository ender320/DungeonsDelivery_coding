extends CharacterBody2D
var speed = 60
var agressive_state = false
var player 
var dialogic_start = true

func _ready():
	pass
func _physics_process(delta):
	if agressive_state == true: #isso aqui vai fazer com que o noll vá átras do player!
		position += (player.position - position)/speed #isso aqui faz seguir
	
func _on_detec_zone_body_entered(body):
	player = body #player vai ser o corpo que vai entrar dentro da area de colisão
	if dialogic_start == true:
		Dialogic.start("inimigo")
		dialogic_start = false
		await Dialogic.timeline_ended
		agressive_state = true
		$MeshInstance2D.visible = false
