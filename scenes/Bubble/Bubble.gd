extends RigidBody2D
class_name Player

# VELOCITY
const X_VECTOR = Vector2(-100, 100)
const Y_VECTOR = Vector2(-150, 100)
# FORCE
const FORCE = 2

func _input(event):
	if event.is_action_pressed("click"):
		var dis_start = position
		var dis_end = get_global_mouse_position()
		var dir = dis_start - dis_end
		apply_impulse(Vector2(), dir * FORCE) 
	pass

func _physics_process(delta):
	linear_velocity.x = clamp(linear_velocity.x, X_VECTOR.x, X_VECTOR.y)
	linear_velocity.y = clamp(linear_velocity.y, Y_VECTOR.x, Y_VECTOR.y)
	
	position.x = clamp(position.x, 0 + 30, 720 - 30)
	position.x = clamp(position.x, -5495, 1280)
	pass

func dead():
	queue_free()