extends RigidBody2D
class_name Player

onready var sprite = $Sprite
onready var collision = $CollisionShape2D
onready var sfx_increase_size = $sfx_increase_size
onready var sfx_lose = $sfx_lose

# VELOCITY / FORCE / DISTANCE / SIZE
const X_VECTOR = Vector2(-50, 50)
const Y_VECTOR = Vector2(-300, 200)
const FORCE = 100
const UNIT_SIZE = .15
var distance = 0
var is_alive = true


# SIGNALS
signal update_air
signal show_end_game_lose
signal show_end_game_win

func _ready():
#	$CollisionShape2D.disabled = false
	pass

func _input(event):
	if event.is_action_pressed("click"):
		var dis_start = get_global_mouse_position()
		var dis_end = position
		var dir = (dis_end - dis_start).normalized() * Vector2(50,50)
		apply_impulse(Vector2(), dir * FORCE)
		print(dir, (dis_end - dis_start).normalized())
	pass

func _physics_process(delta):
	if is_alive:
		
		var bodies = get_colliding_bodies()
		if bodies.size() > 0:
			if bodies[0] is Ball:
				dead()
		
		linear_velocity.x = clamp(linear_velocity.x, X_VECTOR.x, X_VECTOR.y)
		linear_velocity.y = clamp(linear_velocity.y, Y_VECTOR.x, Y_VECTOR.y)
		
		position.x = clamp(position.x, 0 + 30, 720 - 30)
		position.y = clamp(position.y, -6775*3, 0)
		distance = int(position.y / 25) * -1
	pass

func increase_size():
	sprite.scale = sprite.scale + Vector2(UNIT_SIZE, UNIT_SIZE)
	collision.shape.radius = 10 * sprite.scale.x
	emit_signal("update_air")
	sfx_increase_size.play()
	pass

func dead():
	if is_alive:
		visible = false
		is_alive = false
		call_deferred("collision.set_disabled", true)
		linear_velocity = Vector2.ZERO
		sfx_lose.play()

func mission_accomplished():
	emit_signal("show_end_game_win")
	queue_free()

func _on_sfx_lose_finished():
	emit_signal("show_end_game_lose")
	queue_free()
	pass # Replace with function body.
