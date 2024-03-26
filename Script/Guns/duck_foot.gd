extends ShootingMachine

@export var number_barrel = 3
@export var barrel_angle = 45
var angle = -90
var barrel_radians = 0.0

func _ready():
	angle = -90 -(barrel_angle*(float(number_barrel)/2 - 0.5))
	barrel_radians = deg_to_rad(barrel_angle)
	_load_bullet()

func shot():
	for n in number_barrel:
		direction = Vector2.RIGHT.rotated(deg_to_rad(angle) + (n * barrel_radians))
		_spawn_bullet(global_position,main.ATK,main.M_ATK,direction)
		pass
	pass
