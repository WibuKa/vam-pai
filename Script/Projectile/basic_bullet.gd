extends Projectile

func _ready():
	connect("area_entered",area_entered)

func _physics_process(delta):
	position.y -= SPEED * delta
	if position.y <= -450:
		_destroy()

func area_entered(enemy):
	enemy._take_damage(DAMAGE)
	_destroy()
	pass

func _destroy():
	queue_free()
	pass
