extends Area2D
class_name Projectile

@export var SPEED = 265
@export var MAGIC = 0
@export var DAMAGE = 0
@export var direction = Vector2.DOWN
var damage_factor = 1
var magic_factor = 1
@export var destroy = true
var crit = false

func _hit_effect(path_:String,Pos:Vector2):
	var Load = load(path_)
	var Fx = Load.instantiate()
	get_node("/root/game").add_child(Fx)
	Fx.position = Pos
	pass
