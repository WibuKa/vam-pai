extends Node

func _float_number(number,pos:Vector2,coler:Color):
	var Load = load("res://Object/Graphic/Effect/float_number.tscn")
	var Fx = Load.instantiate()
	get_node("/root/game/Effect").add_child(Fx)
	Fx.position = pos
	Fx.number = number
	Fx.color = coler

func _spawn_effect(path:String,pos:Vector2):
	var Load = load(path)
	var Fx = Load.instantiate()
	get_node("/root/game/Effect").add_child(Fx)
	Fx.position = pos
	return Fx
