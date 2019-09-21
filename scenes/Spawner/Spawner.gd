extends Node2D

export(String) var object_to_spawn = ""
export(int) var timer_wait_time = 0
export(int) var x_vel = 250
var ball_scn = preload("res://scenes/Obstacles/Ball/Ball.tscn")
var balloon_scn = preload("res://scenes/Obstacles/Balloon/Balloon.tscn")
var shooting_star_scn = preload("res://scenes/Obstacles/Shooting_Star/Shooting_Star.tscn")
signal create_object

func _ready():
	$Timer.wait_time = timer_wait_time
	$Timer.start()
	pass

func _on_Timer_timeout():
	match object_to_spawn:
		"BALL": emit_signal("create_object", "BALL", ball_scn, position, x_vel)
		"BALLOON" : emit_signal("create_object", "BALLOON", balloon_scn, position)
		"SHOOTINGSTAR" : emit_signal("create_object", "SHOOTINGSTAR", shooting_star_scn, position)
	pass # Replace with function body.
