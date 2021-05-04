extends Node

## Variáveis

var score_file = "user://highscore.txt"
var levels = ["res://Maps/Level1.tscn", "res://Maps/Level2.tscn"]

var highscore = 0

var current_level

var score = 0

var start_screen = "res://ControlScreens/StartScreen.tscn"
var end_screen = "res://ControlScreens/EndScreen.tscn"

## Funções do sistema

func _ready():
	setup()
	pass

## Funções

func new_game():
	current_level = -1
	score = 0
	next_level()
	pass

func game_over():
	if (score > highscore):
		highscore = score
		save_score()
	get_tree().change_scene(end_screen)
	pass

func next_level():
	current_level += 1
	if (current_level >= Global.levels.size()):
		# Não existem mais níveis :(
		game_over()
	else:
		get_tree().change_scene(levels[current_level])
	pass

func setup():
	var f = File.new()
	if (f.file_exists(score_file)):
		f.open(score_file, File.READ)
		var content = f.get_as_text()
		highscore = int(content)
		f.close()
	pass

func save_score():
	var f = File.new()
	f.open(score_file, File.WRITE)
	f.store_string(str(highscore))
	f.close()
	pass














