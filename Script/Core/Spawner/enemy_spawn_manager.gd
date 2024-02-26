extends Node
const bound = Vector2(-110,110)

func _spawn_enemy(path:String):
	var enemy_load = load(path)
	var enemy = enemy_load.instantiate()
	%Enemy.add_child(enemy)
	enemy.position = Vector2(randi_range(bound.x,bound.y),-460)
