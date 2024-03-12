extends Node
const y_spawn = -250

func _ready():
	skull_army()

func skull_army():
	for n in 5:
		_spawn_enemy("res://Object/Enemy/skull_fire.tscn",Vector2(-52 + 25 * n,y_spawn)) 

func _spawn_enemy(path:String,position_spawn:Vector2):
	var enemy_load = load(path)
	var enemy = enemy_load.instantiate()
	%Enemy.add_child(enemy)
	enemy.position = position_spawn

