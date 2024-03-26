extends Creature
class_name Enemy

@export var body_damage = 20
@export var coin_drop = Vector2(2,4)
@export var soul_drop_rate = 20
@export var direction = Vector2.DOWN
var time_delay_spawn = 0
var delay_spawn = false
var death = false
var speed
var time_hurt = 0.0
#state

@onready var gem_load = load("res://Object/Other/gem0.tscn")
@onready var soul_load = load("res://Object/Other/soul.tscn")

var player:Player

func _set_state():
	hp = HP
	speed = SPEED

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

func _take_damage(Damage):
	if delay_spawn == false:
		hp -= Damage
		time_hurt = 0.1
		if hp <= 0:
			death = true

func _spawn_dust():
	var load_dust = load("res://Object/Graphic/Effect/dust.tscn")
	var Dust = load_dust.instantiate()
	Dust.position = position
	get_node("/root/game").add_child(Dust)
	pass
