extends Area2D
class_name Obstacle

onready var sprite = $Sprite
export(bool) var flipped = false
var disable_flip = false
var flippedAt = 0
var speed = 80
var direction = Vector2(1,0)

# WHEN PARENT IS PATH FOLLOW 2D
export(float) var unit_speed = .1
var flippedUnit = false

func _ready():
	
	connect("body_entered", self, "_on_Obstacle_body_entered")
	
	if flipped:
		flippedAt = -51
		direction = Vector2(1,0)
		sprite.flip_h = true
		flippedUnit = true
	else:
		flippedAt = 721
		direction = Vector2(-1,0)
		sprite.flip_h = false
		flippedUnit = false

func _process(delta):
	if get_parent() is PathFollow2D:
#		prints(delta, unit_speed, unit_speed * delta, get_parent().unit_offset)
		if flippedUnit:
			get_parent().unit_offset += unit_speed * delta
		else:
			get_parent().unit_offset -= unit_speed * delta
		get_parent().unit_offset = clamp(get_parent().unit_offset, 0, 1)
			
		if get_parent().unit_offset == 0 || get_parent().unit_offset == 1:
			flip()
	else:
		position += direction * speed * delta
		if (position.x < -50 and flippedAt > 720) or (position.x > 720 and flippedAt < -50):
			flippedAt = position.x
			flip()
	pass

func _on_Obstacle_body_entered(body):
	if body is Player:
		body.dead()
	pass # Replace with function body.

func flip():
	if get_parent() is PathFollow2D:
		flippedUnit = !flippedUnit
		if !disable_flip:
			sprite.flip_h = !sprite.flip_h
	else:
		direction = Vector2(direction.x * -1,0)
		sprite.flip_h = !sprite.flip_h