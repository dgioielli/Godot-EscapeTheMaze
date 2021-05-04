extends CanvasLayer

## Funções de sistema

func _ready():
	$MarginContainer/ScoreLabel.text = str(Global.score)
	pass


## Funções do HUD

func update_score(value):
	Global.score += value
	$MarginContainer/ScoreLabel.text = str(Global.score)
	pass

















