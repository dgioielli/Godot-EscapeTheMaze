extends Area2D

## Variáveis

export (int) var speed

var tile_size = 64
var can_move = true
var facing = CtesDir.RIGHT
var moves = {	CtesDir.RIGHT : Vector2(1, 0),
				CtesDir.LEFT : Vector2(-1, 0),
				CtesDir.UP : Vector2(0, -1),
				CtesDir.DOWN : Vector2(0, 1)}
onready var raycasts = {	CtesDir.RIGHT : $RayCastRight,
							CtesDir.LEFT : $RayCast2Left,
							CtesDir.UP : $RayCast2Up,
							CtesDir.DOWN : $RayCast2Down}


## Eventos de sinais:


func _on_MoveTween_tween_completed(object, key):
	can_move = true
	$AnimationPlayer.stop()
	pass # Replace with function body.



## Funções de Movimentação:

func move(dir):
	$AnimationPlayer.playback_speed = speed
	facing = dir
	if (raycasts[facing].is_colliding()):
		return false
	can_move = false
	$AnimationPlayer.play(facing)
	$MoveTween.interpolate_property(self, "position", position,
									position + moves[facing] * tile_size,
									1.0 / speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$MoveTween.start()
	return true








