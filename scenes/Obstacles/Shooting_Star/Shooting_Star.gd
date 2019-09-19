extends Area2D

onready var sprite = $Sprite
onready var collision = $CollisionShape2D
export(int, 1) var flipped = 0
var speed = 80
var direction = Vector2(-1,1) # 45 degress

func _ready():
	if flipped:
		collision.rotation_degrees = 135
		direction = Vector2(1,-1)
		sprite.flip_h = true
	else:
		collision.rotation_degrees = 45
		direction = Vector2(-1,1)
		sprite.flip_h = false

func _process(delta):
	position += direction * speed * delta
	pass

func _on_Butterfly_body_entered(body):
	if body is Player:
		body.dead()
	pass # Replace with function body.