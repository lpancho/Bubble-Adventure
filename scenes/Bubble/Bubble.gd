extends RigidBody2D
class_name Player

onready var sprite = $Sprite
onready var collision = $CollisionShape2D
onready var sfx_increase_size = $sfx_increase_size

# VELOCITY
const X_VECTOR = Vector2(-50, 50)
const Y_VECTOR = Vector2(-100, 100)
# FORCE
const FORCE = 10
var distance = 0

# SIGNALS
signal update_air

func _input(event):
	if event.is_action_pressed("click"):
		var dis_start = position
		var dis_end = get_global_mouse_position()
		var dir = dis_start - dis_end
		apply_impulse(Vector2(), dir * FORCE)
		print(dir * FORCE) 
	pass

func _physics_process(delta):
	linear_velocity.x = clamp(linear_velocity.x, X_VECTOR.x, X_VECTOR.y)
	linear_velocity.y = clamp(linear_velocity.y, Y_VECTOR.x, Y_VECTOR.y)
	
	position.x = clamp(position.x, 0 + 30, 720 - 30)
	position.y = clamp(position.y, -6775, 0)
	distance = int(position.y / 25) * -1
	pass

func increase_size():
	sprite.scale = sprite.scale + Vector2(.1,.1)
	collision.shape.radius = 10 * sprite.scale.x
	emit_signal("update_air")
	sfx_increase_size.play()
	pass

func dead():
	queue_free()