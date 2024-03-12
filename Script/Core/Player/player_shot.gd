extends Node

@export_file(".tscn") var projectiles
@onready var player:Player = owner
@onready var state = get_parent()

@export var ray_shot:RayCast2D
@export var ray_shot2:RayCast2D

var time_shot = 0


func _process(delta):
	#TIMER
	player.shooting = false
	if time_shot > 0:
		time_shot -= delta
	elif Input.is_action_pressed("attack"):
		time_shot = player.TIME_SHOT
		_shoot()
	

func  _shoot():
	player.shooting = true
	state.shoot = true
	await get_tree().create_timer(0.1).timeout
	var Bullet_load = load(projectiles)
	var Bullet = Bullet_load.instantiate()
	get_node("/root/game").add_child(Bullet)
	Bullet.position = player.position
	Bullet.DAMAGE = player.ATK
	Bullet.MAGIC = player.M_ATK
	if randi_range(0,100) <= player.CRIT:
		Bullet.crit = true
		Bullet.DAMAGE = player.ATK * 2
		Bullet.MAGIC = player.M_ATK * 2
	pass
