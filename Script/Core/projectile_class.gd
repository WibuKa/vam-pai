extends Area2D
class_name Projectile

@export var SPEED = 265
@export var MAGIC = 0
@export var DAMAGE = 0
var direction = Vector2.DOWN
var damage_factor = 1
var magic_factor = 1
@export var destroy = true
var crit = false
