extends Node2D

export(String) var bubble_type
export(int, 1) var flipped = 0

onready var anim_small = $Anim_Small
onready var anim_big = $Anim_Big

func show_bubble():
	if bubble_type == "SMALL":
		anim_small.play("default")
	elif bubble_type == "BIG":
		anim_big.play("default")