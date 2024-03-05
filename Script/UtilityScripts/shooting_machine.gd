extends Node2D

@export_file(".tscn") var projectile
@export var main:Node2D

func _shoot():
	await get_tree().create_timer(0.1).timeout
	var Bullet_load = load(projectile)
	var Bullet = Bullet_load.instantiate()
	get_node("/root/game").add_child(Bullet)
	Bullet.position = global_position
	Bullet.DAMAGE = main.ATK
	Bullet.MAGIC = main.M_ATK
	pass
