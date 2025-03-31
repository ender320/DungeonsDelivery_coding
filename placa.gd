extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		Dialogic.start("placa")

func _on_body_exited(body):
	if body.name == "player":
		Dialogic.end_timeline()
