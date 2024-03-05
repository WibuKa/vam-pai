extends Enemy

func _ready():
	_set_state()

func _physics_process(delta):
	#walk
	if slow:
		$Sprite.modulate.r = 0
		slow_time -= delta
		if slow_time <= 0:
			slow = false
			$Sprite.modulate.r = 1
			slow_factor = 1
	
	position.y += (TheGame.ROLL_SPEED + speed) * delta * slow_factor
	
	if time_hurt > 0:
		time_hurt -= delta
		$Sprite.modulate = Color(1.5, 1.5, 3)
		if time_hurt <= 0:
			$Sprite.modulate = Color(1, 1, 1)
	
	$AnimationPlayer.speed_scale = (speed/SPEED) * slow_factor
	
	if position.y >= 160:
		queue_free()

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
