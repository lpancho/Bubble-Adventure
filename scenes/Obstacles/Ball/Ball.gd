extends RigidBody2D

export(int) var x_vel = 0

func randomize_linear_velocity():
#	var x = randi() % 400 + 200
	var x = 300
	if position.x > 0:
		x *= -1
	return Vector2(x, -200)
