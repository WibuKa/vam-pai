extends Node2D

var pick_up = false
@onready var player = get_node("/root/game/player")

func _process(delta):
	if position.distance_to(player.position) <= TheGame.MAGNET:
		pick_up = true
	
	if  position.distance_to(player.position) <= 5:
		_pick_up()
	
	if pick_up == true:
		position = position.lerp(player.position,5*delta)
	else :
		position.y += TheGame.ROLL_SPEED*delta

func _pick_up():
	TheGame._plus_exp(2)
	queue_free()
	pass
