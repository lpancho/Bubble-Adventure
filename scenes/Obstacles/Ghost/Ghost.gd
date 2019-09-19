extends Area2D

onready var sprite = $Sprite
export(int, 1) var flipped = 0
var flippedAt = 0
var speed = 80
var direction = Vector2(1,0)

func _ready():
	if flipped:
		flippedAt = -51
		direction = Vector2(1,0)
		sprite.flip_h = false
	else:
		flippedAt = 721
		direction = Vector2(-1,0)
		sprite.flip_h = true

func _process(delta):
	position += direction * speed * delta
	if (position.x < -50 and flippedAt > 720) or (position.x > 720 and flippedAt < -50):
		flippedAt = position.x
		flip()
	pass

func _on_Butterfly_body_entered(body):
	if body is Player:
		body.dead()
	pass # Replace with function body.

func flip():
	direction = Vector2(direction.x * -1,0)
	sprite.flip_h = !sprite.flip_h