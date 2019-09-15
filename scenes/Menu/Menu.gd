extends Control

onready var anim_gui = $Anim_GUI
onready var fish_1 = $obj_fish 	# the fish that face to the right after animation
onready var fish_2 = $obj_fish2 # the fish that faces to the left after animation

# Called when the node enters the scene tree for the first time.
func _ready():
	anim_gui.play("show_fishes")
	pass # Replace with function body.

func _on_Anim_GUI_animation_finished(anim_name):
	if anim_name == "show_fishes":
		fish_1.get_node("Bubbles").show_bubble()
		fish_2.get_node("Bubbles").show_bubble()
	elif anim_name == "start_game":
		get_tree().change_scene("res://scenes/Stages/Stage1/Stage1.tscn")
	pass # Replace with function body.
	
func _on_tb_play_pressed():
	anim_gui.play("start_game")
	pass # Replace with function body.
