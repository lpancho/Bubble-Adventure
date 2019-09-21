extends RigidBody2D
class_name Ball

export(int) var x_vel = 0

func randomize_linear_velocity():
	if position.x > 0:
		x_vel *= -1
	return Vector2(x_vel, -200)

func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
