extends Area2D

onready var sprite = $Sprite
onready var collision = $CollisionShape2D
var speed = 160
var direction = Vector2(-1,1) # 45 degress

func _process(delta):
	position += direction * speed * delta
	pass

func _on_Butterfly_body_entered(body):
	if body is Player:
		body.dead()
	pass # Replace with function body.

func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.

func _on_Shooting_Star_body_entered(body):
	if body is Player:
		body.dead()
	pass # Replace with function body.
