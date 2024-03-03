extends Node2D

@export_file(".tscn") var path
@export var TIME = 0.5
var time_spawn = 0

func spawn():
	var obj_load = load(path)
	var obj = obj_load.instantiate()
	get_node("/root/game/Effect").add_child(obj)
	obj.position = global_position
	pass

func _process(delta):
	if time_spawn > 0:
		time_spawn -= delta
	else :
		time_spawn = TIME
		spawn()
