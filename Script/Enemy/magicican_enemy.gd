extends Enemy

var fly_point:Vector2
var start_pos:Vector2
var delay_fly = false
func _ready():
	_set_state()
	start_pos = position
	fly_point = get_node("/root/game/fly_point").get_child(randi_range(0,5)).position

func _physics_process(delta):
	#walk
	if slow:
		$Sprite.modulate.r = 0
		slow_time -= delta
		if slow_time <= 0:
			slow = false
			$Sprite.modulate.r = 1
			slow_factor = 1
	
	_move(delta)

	if time_hurt > 0:
		time_hurt -= delta
		$Sprite.modulate = Color(1.5, 1.5, 3)
		if time_hurt <= 0:
			$Sprite.modulate = Color(1, 1, 1)
	
	$AnimationPlayer.speed_scale = (speed/SPEED) * slow_factor
	
	if position.y >= 160:
		queue_free()

func _move(delta):
	#position.y += (TheGame.ROLL_SPEED + speed) * delta * slow_factor
	position = position.move_toward(fly_point, speed*delta)
	if position.distance_to(fly_point) <= 5 and delay_fly == false:
		delay_fly = true
		await get_tree().create_timer(1).timeout
		fly_point = get_node("/root/game/fly_point").get_child(randi_range(0,5)).position
		start_pos = position
		delay_fly = false

func _take_damage(Damage):
	hp -= Damage
	time_hurt = 0.1
	if hp <= 0:
		_death()

func _death():
	await get_tree().create_timer(0.1).timeout
	queue_free()
	_gem_drop(randi_range(coin_drop.x,coin_drop.y))
	pass

func _gem_drop(quantity):
	var Load = load("res://Object/Other/gem0.tscn")
	for n in quantity:
		var Gem = Load.instantiate()
		get_node("/root/game/Gems").add_child(Gem)
		Gem.position = self.position
		Gem.position += Vector2(randi_range(-10,10),randi_range(-10,10))
	pass
