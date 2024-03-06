extends Projectile

func _ready():
	connect("area_entered",area_entered)

func _physics_process(delta):
	position -= SPEED * delta * direction
	if position.y < -450 or position.y > 15:
		_destroy()

func area_entered(hit_box):
	if !hit_box.is_in_group("projectile"):
		DAMAGE *= damage_factor
		if MAGIC > 0:
			Effect._float_number("-"+ str(MAGIC),global_position - Vector2(0,18),Color(0.3411,0.847,0.949))
		if DAMAGE > 0:
			Effect._float_number("-"+str(DAMAGE),global_position - Vector2(0,10),Color(1,0.270,0.2705))
		hit_box._take_damage(DAMAGE + MAGIC)
		_destroy()
	pass

func _destroy():
	if destroy:
		queue_free()
	pass
