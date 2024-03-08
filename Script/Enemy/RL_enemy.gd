extends Enemy

func _ready():
	_set_state()
	if position.x > 0:
		direction = Vector2(-1,0)
	else :
		direction = Vector2(1,0)

func _physics_process(delta):
	#walk
	if slow:
		_slow_down(delta)
	_move(delta)
	if abs(position.x) >= 50:
		re_dire()
	
	if time_hurt > 0:
		time_hurt -= delta
		$Sprite.modulate = Color(1.5, 1.5, 3)
		if time_hurt <= 0:
			$Sprite.modulate = Color(1, 1, 1)
	
	if position.y >= 160:
		queue_free()

func re_dire():
	direction.x = -direction.x

func _take_damage(Damage):
	hp -= Damage
	time_hurt = 0.1
	if hp <= 0:
		_death()

func _death():
	await get_tree().create_timer(0.1).timeout
	queue_free()
	_gem_drop()
	_soul_drop()
	pass

func _move(delta):
	position.x += SPEED * direction.x * delta
	position.y += TheGame.ROLL_SPEED * delta
	pass
