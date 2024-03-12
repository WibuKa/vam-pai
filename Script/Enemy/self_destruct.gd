extends Node2D

func _process(delta):
	if owner.death:
		for n in get_children():
			n._shoot()
