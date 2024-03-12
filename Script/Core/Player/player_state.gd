extends Node
class_name StatePlayer

var walk = true
var shoot = false

func _process(delta):
	if walk == false and TheGame.ROLL_SPEED == 0:
		$animation._stop()
	else :
		$animation._walk()
	if shoot:
		shoot = false
		$animation._attack()
