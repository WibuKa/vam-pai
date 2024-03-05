extends Node2D

var angle = []
var distance = 32

func _ready():
	_handle()

func _process(delta):
	for n in get_child_count():
		angle[n] += delta * 180
		if angle[n] >= 360:
			angle[n] = 0
		get_child(n).position = Vector2(cos(deg_to_rad(angle[n])),sin(deg_to_rad(angle[n]))*0.9) * distance

func _handle():
	angle = []
	for n in get_child_count():
		angle.append(360.0/get_child_count() * n)
	pass
