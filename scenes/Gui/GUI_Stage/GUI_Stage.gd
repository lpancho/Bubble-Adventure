extends CanvasLayer

onready var lbl_score = $TextureScore/Label
onready var lbl_distance = $Distance
var score = 0
var distance = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func update_score(added_score):
	score += added_score
	lbl_score.text = str(score)
	pass
	
func update_distance(added_distance):
	distance = added_distance
	lbl_distance.text = "Distance: " + str(distance) + "m"