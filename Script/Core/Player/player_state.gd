extends Node

var walk = true
var shoot = false

func _process(delta):
	if walk:
		$animation._walk()
	if shoot:
		shoot = false
		$animation._attack()
