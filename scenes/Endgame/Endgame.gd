extends Control

onready var lbl_airs = $lbl_airs
onready var o_win = $olay_win
onready var o_lose = $olay_lose

func _ready():
	o_win.visible = false
	o_lose.visible = false
	pass

func show_win(score):
	o_win.visible = true
	lbl_airs.text = str(score)
	pass

func show_lose(score):
	o_lose.visible = true
	lbl_airs.text = str(score)
	pass

func _on_TryAgain_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
