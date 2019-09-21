extends Path2D

export(PackedScene) var object
export(bool) var disable_flip = false
export(bool) var flipped = false
export(float) var unit_speed = .1
export(float) var starting_offset = 0

func _ready():
	if object != null:
		var obj = object.instance()
		obj.disable_flip = disable_flip
		obj.flipped = flipped
		obj.unit_speed = unit_speed
		
		get_node("PathFollow2D").add_child(obj)
		get_node("PathFollow2D").unit_offset = starting_offset
	pass # Replace with function body.
