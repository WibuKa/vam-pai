extends ShootingMachine

@export_enum("Player","Random","None") var target_type = "player"
@export var quantily = 1
@export var TIME_DELAY = 0.1
var position_shot = Vector2.ZERO
var magazine = 0
var continuous = false
var time_delay = 0.0
var Bullet_load

func _ready():
	Bullet_load = load(projectile)

func _shoot():
	position_shot = global_position
	if target_type == "Player":
		direction = global_position.direction_to(TheGame.player_position)
		direction = -direction
	
	if quantily > 1:
		continuous = true
		magazine = quantily
		time_delay = 0
	elif quantily == 1 :
		_spawn_bullet()
	pass

func _process(delta):
	if continuous:
		if time_delay <= 0:
			_spawn_bullet()
			magazine -= 1
			time_delay = TIME_DELAY
		else :
			time_delay -= delta
		if magazine <= 0:
			continuous = false
	
func _spawn_bullet():
	var Bullet = Bullet_load.instantiate()
	get_node("/root/game").add_child(Bullet)
	Bullet.position = position_shot
	Bullet.DAMAGE = main.ATK
	Bullet.MAGIC = main.M_ATK
	Bullet.direction = direction
