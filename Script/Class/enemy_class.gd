extends Node2D
class_name Enemy

@export var HP = 100
@export var SPEED = 5
@export var body_damage = 20
@export var coin_drop = Vector2(2,4)
@export var soul_drop_rate = 100

var hp
var speed
var time_hurt = 0.0
#state
var slow = false
var slow_time = 0
var slow_factor = 1

@onready var gem_load = load("res://Object/Other/gem0.tscn")
@onready var soul_load = load("res://Object/Other/soul.tscn")

func _set_state():
	hp = HP
	speed = SPEED

func _slow(percent:float,time):
	slow = true
	slow_time = time
	slow_factor = (1.0 -(percent/100))
	pass

func _gem_drop():
	var quantity = randi_range(coin_drop.x,coin_drop.y)
	for n in quantity:
		var Gem = gem_load.instantiate()
		get_node("/root/game/Drop/Gems").add_child(Gem)
		Gem.position = self.position
		Gem.position += Vector2(randi_range(-10,10),randi_range(-10,10))
	pass

func _soul_drop():
	if randi_range(1,100) <= soul_drop_rate:
		var soul = soul_load.instantiate()
		get_node("/root/game/Drop/Souls").add_child(soul)
		soul.position = self.position
