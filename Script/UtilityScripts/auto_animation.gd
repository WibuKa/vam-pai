extends Sprite2D
@export var TIME = 0.1
@export var destroy = true
@export var random_frame = false
@export var random_scale = false

func _ready():
	_animation()
	if random_frame:
		self.frame = randi_range(0,hframes - 1)
	if random_scale:
		scale.x = [1,-1].pick_random()
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
