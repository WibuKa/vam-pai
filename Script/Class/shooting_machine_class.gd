extends Node2D
class_name ShootingMachine

@export_file(".tscn") var projectile
@export var main:Node2D
@export var direction = Vector2.UP
var Bullet_load

func _load_bullet():
	Bullet_load = load(projectile)

func _spawn_bullet(Pos,atk,m_atk,Direction):
	var Bullet = Bullet_load.instantiate()
	get_node("/root/game").add_child(Bullet)
	Bullet.position = Pos
	Bullet.DAMAGE = atk
	Bullet.MAGIC = m_atk
	Bullet.direction = Direction
