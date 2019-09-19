extends Node2D

var ball_scn = preload("res://scenes/Obstacles/Ball/Ball.tscn")
signal create_ball

func create_new_ball():
	emit_signal("create_ball", ball_scn, position)

func _on_Timer_timeout():
	create_new_ball()
	pass # Replace with function body.
