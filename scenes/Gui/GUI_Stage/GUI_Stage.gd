extends CanvasLayer

onready var texture_sound = $TextureSound
onready var lbl_texture = $TextureScore
onready var lbl_score = $TextureScore/Label
onready var lbl_distance = $Distance
var score = 0
var distance = 0
var is_muted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var master_bus = AudioServer.get_bus_index("Master")
	var volume = AudioServer.get_bus_volume_db(master_bus)
	if volume != 0:
		is_muted = true
		texture_sound.pressed = is_muted
	pass # Replace with function body.
	
func update_score(added_score):
	score += added_score
	lbl_score.text = str(score)
	pass
	
func update_distance(added_distance):
	distance = added_distance
	lbl_distance.text = "Distance: " + str(distance) + "m"

func hide_gui():
	lbl_texture.hide()
	lbl_distance.hide()
	texture_sound.hide()	

func _on_TextureSound_pressed():
	var master_bus = AudioServer.get_bus_index("Master")
	if !is_muted:
		AudioServer.set_bus_volume_db(master_bus, -80.0)
	else:
		AudioServer.set_bus_volume_db(master_bus, 0)
	is_muted = !is_muted
	pass # Replace with function body.
