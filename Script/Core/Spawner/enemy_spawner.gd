extends Node

@export_file(".tscn") var path_enemy
@export var TIME_SPAWN:Vector2
var time_spawn = 0

func _process(delta):
	if time_spawn > 0:
		time_spawn -= delta
	else :
		time_spawn = randf_range(TIME_SPAWN.x,TIME_SPAWN.y)
		get_parent()._spawn_enemy(path_enemy)
	
