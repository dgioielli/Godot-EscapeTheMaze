extends Area2D

## Sinais

signal coin_pickup

## Variáveis

var textures = { CtesItems.COIN : CtesItems.PATH_COIN,
				 CtesItems.RED_KEY : CtesItems.PATH_RED_KEY,
				 CtesItems.STAR : CtesItems.PATH_STAR}
var type

## Funções do sistema:

func _ready():
	$Tween.interpolate_property($Sprite, "scale", Vector2(1, 1), Vector2(3, 3),
								0.5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($Sprite, "modulate", Color(1, 1, 1, 1),
					Color(1, 1, 1, 0), 0.5, Tween.TRANS_QUAD,Tween.EASE_IN_OUT)

## Funções de eventos de sinais:

func _on_Tween_tween_completed(object, key):
	queue_free()
	pass # Replace with function body.

## Funções do Item:

func init(_type, pos):
	$Sprite.texture = load(textures[_type])
	type = _type
	position = pos

func pickup():
	match type:
		CtesItems.COIN:
			emit_signal("coin_pickup", 1)
			$CoinPickup.play()
		CtesItems.RED_KEY:
			$KeyPickup.play()
	$CollisionShape2D.disabled = true
	$Tween.start()



















