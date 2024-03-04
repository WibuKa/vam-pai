extends Node2D
@export var sprite:Sprite2D
@export var TIME = 0.01
var time_spawn = 0

func _process(delta):
	if time_spawn > 0:
		time_spawn -= delta
	else :
		time_spawn = TIME
		spawn()

func spawn():
	var Load = load("res://Object/Graphic/Effect/disappear_effect.tscn")
	var Ghost = Load.instantiate()
	get_node("/root/game").add_child(Ghost)
	Ghost.texture = sprite.texture
	Ghost.position = global_position
	Ghost.rotation = sprite.global_rotation
	Ghost.modulate.a = 0.25
	pass
