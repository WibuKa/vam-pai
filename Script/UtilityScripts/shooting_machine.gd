extends Node2D

@export_file(".tscn") var projectile
@export var main:Node2D
@export var direction = Vector2.UP

func _shoot():
	var Bullet_load = load(projectile)
	var Bullet = Bullet_load.instantiate()
	get_node("/root/game").add_child(Bullet)
	Bullet.position = global_position
	Bullet.DAMAGE = main.ATK
	Bullet.MAGIC = main.M_ATK
	Bullet.direction = direction
	pass
