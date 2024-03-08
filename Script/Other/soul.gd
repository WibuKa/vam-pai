extends Node2D

var pick_up = false
var a_ = 0
var direction = 0
@onready var player = get_node("/root/game/player")
var delay = true

func _ready():
	direction = [-2,2].pick_random()
	await get_tree().create_timer(0.1).timeout
	delay = false
	
func _process(delta):
	if  position.distance_to(player.position) <= 10:
		_pick_up()
	
	if delay == false:
		a_ += delta*5
		position =  position.move_toward(player.position,2+a_)
		position.x += direction
	position.y += TheGame.ROLL_SPEED*delta
func _pick_up():
	TheGame.soul += 1
	queue_free()
	pass
