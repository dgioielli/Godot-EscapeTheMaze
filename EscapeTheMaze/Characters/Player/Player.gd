extends "res://Characters/Character.gd"

## Sinais:

signal moved
signal dead
signal grabbed_key
signal win

## Funções de sistema:

func _process(delta):
	if (can_move):
		for dir in moves.keys():
			if (Input.is_action_pressed(dir)):
				if (move(dir)):
					emit_signal("moved")
	pass

## Funções de eventos de sinais

func _on_Player_area_entered(area):
	if (area.is_in_group(CtesGroups.ENEMIES)):
		emit_signal("dead")
	if (area.has_method("pickup")):
		area.pickup()
	if (area.type == "key_red"):
		emit_signal("grabbed_key")
	if (area.type == "star"):
		emit_signal("win")
	pass # Replace with function body.

























