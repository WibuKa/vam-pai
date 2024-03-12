extends Node

var player_position = Vector2.ZERO
var player:Player

var ROLL_SPEED = 20
var MAGNET = 30
var exp = 0
var max_exp = 100
var hp = 0
var max_hp = 0
var soul = 0
var coin = 0

func _ready():
	player = get_node("/root/game/player")

func _plus_exp(quanlity):
	exp += quanlity
	_set_exp(100/max_exp * exp)
	if exp >= max_exp:
		get_node("/root/game/player").level += 1
		_reset_exp()
		get_node("/root/game/CanvasLayer/slot_machine")._spin()

func _process(delta):
	player_position = player.position
	hp = get_node("/root/game/player").hp
	max_hp = get_node("/root/game/player").HP
	get_node("/root/game/CanvasLayer/hp_bar/TextureProgressBar").value = int(100.0/float(max_hp) * hp) 
	if hp <= 0:
		_reset()

func _reset():
	get_tree().reload_current_scene()

func _reset_exp():
	exp = 0
	_set_exp(0)

func _pick_up_coin(quanlity):
	_plus_exp(quanlity)
	coin += quanlity
	pass
	
func _set_exp(number):
	get_node("/root/game/CanvasLayer/xp_bar/TextureProgressBar").value = number

func _plus_soul(quanlity):
	soul += quanlity

