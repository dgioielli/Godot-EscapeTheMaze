extends Node2D

## Variáveis

export (PackedScene) var Enemy
export (PackedScene) var Pickup

onready var itens = $Items
var doors = []

## Funções de sistema

func _ready():
	randomize()
	itens.hide()
	set_camera_limits()
	var door_id = $Walls.tile_set.find_tile_by_name("door_red")
	for cell in $Walls.get_used_cells_by_id(door_id):
		doors.append(cell)
	spawn_items()
	$Player.connect("dead", self, "game_over")
	$Player.connect("grabbed_key", self, "_on_Player_grabbed_key")
	$Player.connect("win", self, "_on_Player_win")
	pass

## Funções de eventos dos sinais

func game_over():
	#print("dead")
	Global.game_over()
	pass

func _on_Player_grabbed_key():
	for cell in doors:
		$Walls.set_cellv(cell, -1)
	pass

func _on_Player_win():
	#print("win")
	Global.next_level()
	pass


## Funções de controle do nível:

func set_camera_limits():
	var map_size = $Ground.get_used_rect()
	var cell_size = $Ground.cell_size
	$Player/Camera2D.limit_left = map_size.position.x * cell_size.x
	$Player/Camera2D.limit_right = map_size.end.x * cell_size.x
	$Player/Camera2D.limit_top = map_size.position.y * cell_size.y
	$Player/Camera2D.limit_bottom = map_size.end.y * cell_size.y

func spawn_items():
	for cell in itens.get_used_cells():
		var id = itens.get_cellv(cell)
		var type = itens.tile_set.tile_get_name(id)
		var pos = itens.map_to_world(cell) + itens.cell_size/2
		match type:
			"slime_spawn":
				var s = Enemy.instance()
				s.position = pos
				s.tile_size = itens.cell_size
				add_child(s)
			"player_spawn":
				$Player.position = pos
				$Player.tile_size = itens.cell_size
			"key_red", "coin", "star":
				var p = Pickup.instance()
				p.init(type, pos)
				add_child(p)
				p.connect("coin_pickup", $HUD, "update_score")
























