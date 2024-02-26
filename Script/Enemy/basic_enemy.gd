extends Enemy

func _physics_process(delta):
	#walk
	position.y += TheGame.ROLL_SPEED * delta

func _take_damage(Damage):
	HP -= Damage
	if HP <= 0:
		_death()

func _death():
	queue_free()
	pass
