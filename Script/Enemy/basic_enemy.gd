extends Enemy
@export var flip = false

func _ready():
	_set_state()

func _process(delta):
	if death:
		_death()

func _physics_process(delta):
	if flip :
		$Sprite.scale.x = direction.x
	
	if time_delay_spawn > 0:
		time_delay_spawn -= delta
		delay_spawn = true
	else :
		delay_spawn = false
	
	if delay_spawn == false:
		position.x += speed * direction.x * delta
		position.y += speed * direction.y * delta
		position.y += TheGame.ROLL_SPEED * delta
	
	if time_hurt > 0:
		time_hurt -= delta
		$Sprite.modulate = Color(1.5, 1.5, 3)
		if time_hurt <= 0:
			$Sprite.modulate = Color(1, 1, 1)
	
	if position.y >= 160:
		queue_free()

func _death():
	_spawn_dust()
	_gem_drop()
	_soul_drop()
	queue_free()
	pass
