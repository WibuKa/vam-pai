extends Control

var size_health_pot = 1
var health_pot = 1

@export var health_pot_small:Array[Texture]

func _process(delta):
	if Input.is_action_just_pressed("health"):
		_drink()

func _button_down():
	_drink()
	pass # Replace with function body.

func _drink():
	if health_pot > 0:
		health_pot -= 1
		if size_health_pot == 1:
			$TextureButton.texture_normal = health_pot_small[health_pot]
		get_node("/root/game/player").hp += 15
