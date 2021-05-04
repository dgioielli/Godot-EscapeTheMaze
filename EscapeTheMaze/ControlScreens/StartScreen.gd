extends Control

## Funções de sistema:

func _ready():
	$ScoreNotice.text = "High Score " + str(Global.highscore)
	pass

func _input(event):
	if (event.is_action_pressed("ui_select")):
		Global.new_game()
	pass













