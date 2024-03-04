extends Node2D
class_name Enemy

@export var HP = 100
@export var SPEED = 5
@export var body_damage = 20
@export var coin_drop = Vector2(2,4)

var hp
var speed
var time_hurt = 0.0
#state
var slow = false
var slow_time = 0
var slow_factor = 1

func _set_state():
	hp = HP
	speed = SPEED

func _slow(percent:float,time):
	slow = true
	slow_time = time
	slow_factor = (1.0 -(percent/100))
	pass
