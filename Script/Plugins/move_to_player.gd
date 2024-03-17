extends Node2D

@export_enum("only","continuous") var type = "only"
var direction = Vector2.ZERO

func _ready():
	await get_tree().create_timer(1).timeout
	if type == "only":
		direction = global_position.direction_to(get_node("/root/game/player").position)
		owner.direction = direction
		pass
