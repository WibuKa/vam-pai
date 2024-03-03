extends Node

var ROLL_SPEED = 14
var MAGNET = 30
var exp = 0
var max_exp = 100

func _plus_exp(quanlity):
	exp += quanlity
	_set_exp(100/max_exp * exp)
	if exp >= max_exp:
		get_node("/root/game/CanvasLayer/slot_machine")._spin()

func _reset_exp():
	exp = 0
	_set_exp(0)

func _set_exp(number):
	get_node("/root/game/CanvasLayer/xp_bar/TextureProgressBar").value = number
