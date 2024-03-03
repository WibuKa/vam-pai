extends Node2D

@export_file(".tscn") var TREE
var time_spawn_tree = 0

func _ready():
	time_spawn_tree = randf_range(0.5,4)
func _process(delta):
	#--SPAWN--#
	if time_spawn_tree > 0:
		time_spawn_tree -= delta
	else :
		time_spawn_tree = randf_range(0.5,4)
		spawn_tree()
	
	#--ROLL--#
	if get_child_count() > 0:
		for n in get_children():
			n.position.y += TheGame.ROLL_SPEED * delta
			if n.position.y >= 50:
				n.queue_free()

func spawn_tree():
	var Tree_load = load(TREE)
	var _tree = Tree_load.instantiate()
	add_child(_tree)
	_tree.offset.x = randi_range(52,56)
	_tree.position = Vector2(0,-227)
	_tree.scale.x = [-1, 1].pick_random()
	_tree.frame = randi_range(0,4)
	pass
