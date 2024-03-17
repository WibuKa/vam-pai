extends Node

var direction_x = 1

func _ready():
	owner.direction.y = 0.5
	pass

func _physics_process(delta):
	
	if abs(owner.position.x) > 55:
		owner.direction.x = -owner.direction.x
