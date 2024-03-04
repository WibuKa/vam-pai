extends Node2D

@export_file(".tscn") var OBJECT
var time_spawn_tree = 0

func _ready():
	time_spawn_tree = randf_range(0.5,4)
func _process(delta):
	#--SPAWN--#
	if time_spawn_tree > 0:
		time_spawn_tree -= delta
	else :
		time_spawn_tree = randf_range(2,6)
		spawn_object()
	
	#--ROLL--#
	if get_child_count() > 0:
		for n in get_children():
			n.position.y += TheGame.ROLL_SPEED * delta
			if n.position.y >= 50:
				n.queue_free()

func spawn_object():
	var Object_load = load(OBJECT)
	var _object = Object_load.instantiate()
	add_child(_object)
	_object.position.x = randi_range(-58,58)
	_object.position.y = -227
	_object.frame = randi_range(0,_object.hframes -1)
	pass
