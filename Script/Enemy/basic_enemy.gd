extends Enemy

func _ready():
	_set_state()

func _process(delta):
	if death:
		_death()

func _physics_process(delta):
	#walk
	if slow:
		_slow_down(delta)
	
	if speed != 0:
		position.y += (TheGame.ROLL_SPEED + speed) * delta * slow_factor
	else :
		position.y += TheGame.ROLL_SPEED * delta
	
	if time_hurt > 0:
		time_hurt -= delta
		$Sprite.modulate = Color(1.5, 1.5, 3)
		if time_hurt <= 0:
			$Sprite.modulate = Color(1, 1, 1)
	
	if SPEED != 0:
		$AnimationPlayer.speed_scale = (speed/SPEED) * slow_factor
	
	if position.y >= 160:
		queue_free()

func _take_damage(Damage):
	hp -= Damage
	time_hurt = 0.1
	if hp <= 0:
		death = true

func _death():
	queue_free()
	_gem_drop()
	_soul_drop()
	pass
