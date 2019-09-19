extends Node2D

onready var gui = $GUI_Stage
onready var player = $Bubble
const TOTAL_DISTANCE = 6775

func _ready():
	pass # Replace with function body.

func _process(delta):
	gui.update_distance(player.distance)
	pass

func _on_Spawner_create_ball(scn, pos):
	var obj = scn.instance()
	obj.position = pos
	add_child(obj)
	obj.linear_velocity = obj.randomize_linear_velocity()
	pass # Replace with function body.

func _on_Bubble_update_air():
	gui.update_score(1)
	pass # Replace with function body.
