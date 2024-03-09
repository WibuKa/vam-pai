extends Node

var direction = Vector2.ZERO
var player:Player

func _ready():
	player = owner
	pass # Replace with function body.

func _physics_process(delta):
	direction = Input.get_vector("left","right","up","down")
	if direction.y < 0:
		direction.y = -0.75
	
	player.velocity = direction * player.SPEED
	if player.position.y < -120:
		player.position.y = -120
	elif player.position.y > -3:
		player.position.y = -3
	pass
