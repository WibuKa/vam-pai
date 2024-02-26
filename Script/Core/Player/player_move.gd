extends Node

var direction = 0
var player:Player

func _ready():
	player = owner
	pass # Replace with function body.

func _physics_process(delta):
	direction = Input.get_axis("left","right")
	player.velocity.x = direction * player.SPEED
	pass
