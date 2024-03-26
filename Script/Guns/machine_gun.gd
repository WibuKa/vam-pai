extends ShootingMachine

@export_enum("Player","Random","None") var target_type = "None"
@export var quantily = 1
@export var TIME_DELAY = 0.1
var position_shot = Vector2.ZERO
var magazine = 0
var continuous = false
var time_delay = 0.0
var angle = 90

func _ready():
	Bullet_load = load(projectile)

func _shoot():
	position_shot = global_position
	if target_type == "Player":
		direction = global_position.direction_to(TheGame.player_position)
		direction = -direction
	elif target_type == "Random":
		angle = randi_range(-45, -135) 
		direction = Vector2.RIGHT.rotated(deg_to_rad(angle))
	
	if quantily > 1:
		continuous = true
		magazine = quantily
		time_delay = 0
	elif quantily == 1 :
		_spawn_bullet(position_shot,main.ATK,main.M_ATK,direction)
	pass

func _process(delta):
	if continuous:
		if time_delay <= 0:
			_spawn_bullet(position_shot,main.ATK,main.M_ATK,direction)
			magazine -= 1
			time_delay = TIME_DELAY
		else :
			time_delay -= delta
		if magazine <= 0:
			continuous = false
