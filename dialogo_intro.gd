extends Area2D

var move

func _on_body_entered(body):
	if body.name == "player":
		Dialogic.start("dialogo_introdução")
	
	
func _on_body_exited(body):
	if body.name == "player":
		Dialogic.end_timeline()
