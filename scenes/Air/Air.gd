extends Area2D

func _on_Air_body_entered(body):
	if body is Player:
		print("_on_Air_body_entered")
		body.increase_size()
		queue_free()
	pass # Replace with function body.

func _process(delta):
	position += Vector2(rand_range(-1,1), rand_range(-1,1))