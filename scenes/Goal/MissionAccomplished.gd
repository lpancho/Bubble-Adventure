extends Area2D

func _on_MissionAccomplished_body_entered(body):
	if body is Player:
		body.mission_accomplished()
	pass # Replace with function body.
