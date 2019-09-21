extends Node2D

onready var bg_grad = $bg_gradient
onready var gui = $GUI_Stage
onready var player = $Bubble
onready var end_game = $Endgame
const TOTAL_DISTANCE = 6775

func _process(delta):
	if has_node("Bubble"):
		gui.update_distance(player.distance)
	pass

func _on_Bubble_update_air():
	gui.update_score(1)
	pass # Replace with function body.

func _on_Spawner_create_object(name, scn, pos, x_vel = 0):
	var obj = scn.instance()
	obj.position = pos
	
	match name:
		"BALL": 
			obj.x_vel = x_vel
			obj.linear_velocity = obj.randomize_linear_velocity()
	
	add_child(obj)
	
	pass # Replace with function body.

func _on_Bubble_show_end_game_win():
	gui.hide_gui()
	end_game.show_win(gui.score)
	pass # Replace with function body.

func _on_Bubble_show_end_game_lose():
	gui.hide_gui()
	end_game.show_lose(gui.score)
	pass # Replace with function body.
