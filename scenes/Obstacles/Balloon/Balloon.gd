extends Area2D

var speed_y = 200
var speed_x = 0

func _process(delta):
	position.y -= speed_y * delta
	position.x += speed_x * delta
	pass

func _on_Timer_timeout():
	speed_x = rand_range(-50, 50)
	print(speed_x)
	pass # Replace with function body.
