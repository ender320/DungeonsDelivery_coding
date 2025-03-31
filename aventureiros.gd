extends Area2D

func _on_body_entered(body):
	Dialogic.start("dialogo_final")
	await Dialogic.timeline_ended
	get_tree().quit()
