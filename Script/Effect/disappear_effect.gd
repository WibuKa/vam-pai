extends Sprite2D

@export var SPEED = 2

func _process(delta):
	modulate.a -= delta * SPEED
	if modulate.a <= 0:
		queue_free()
	pass
