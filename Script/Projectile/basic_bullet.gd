extends Projectile

@onready var player =  get_node("/root/game/player")

func _ready():
	connect("area_entered",area_entered)

func _physics_process(delta):
	position -= SPEED * delta * direction
	if position.y <= -450:
		_destroy()

func area_entered(hit_box):
	if hit_box.is_in_group("Enemy"):
		DAMAGE *= damage_factor
		if MAGIC > 0:
			Effect._float_number(MAGIC,global_position - Vector2(0,18),Color(0.3411,0.847,0.949))
		if DAMAGE > 0:
			Effect._float_number(DAMAGE,global_position - Vector2(0,10),Color.WHITE)
		hit_box._take_damage(DAMAGE + MAGIC)
		player._hit(hit_box.get_parent())
		_destroy()
	pass

func _destroy():
	if destroy:
		queue_free()
	pass
