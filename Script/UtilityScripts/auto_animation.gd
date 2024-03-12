extends Sprite2D
@export var TIME = 0.1
@export var destroy = true

func _ready():
	_animation()
	if destroy:
		await get_tree().create_timer(TIME * hframes).timeout
		queue_free()

func _animation():
	for n in hframes-1:
		await get_tree().create_timer(TIME).timeout
		frame += 1
		if frame + 1 >= hframes:
			break
	await get_tree().create_timer(TIME).timeout
	frame = 0
	_animation()
