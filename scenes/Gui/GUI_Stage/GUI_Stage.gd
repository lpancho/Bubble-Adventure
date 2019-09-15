extends CanvasLayer

onready var lbl_score = $TextureScore/Label
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_score_label(score):
	lbl_score.text = str(score)
	pass

func update_score(added_score):
	score += added_score
	pass
