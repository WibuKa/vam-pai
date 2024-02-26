extends Node

@export_file(".tscn") var projectiles
@onready var player:Player = owner

@export var ray_shot:RayCast2D
@export var ray_shot2:RayCast2D

var time_shot = 0


func _process(delta):
	#TIMER
	if time_shot > 0:
		time_shot -= delta
	elif ray_shot.is_colliding() or ray_shot2.is_colliding():
		time_shot = player.TIME_SHOT
		_shoot()

func  _shoot():
	var Bullet_load = load(projectiles)
	var Bullet = Bullet_load.instantiate()
	get_node("/root/game").add_child(Bullet)
	Bullet.position = player.position
	pass
