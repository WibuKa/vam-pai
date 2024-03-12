extends Node2D

func _process(delta):
	if global_position.y > -203:
		$Sprite.visible = false
	else :
		$Sprite.global_position.y = -188
