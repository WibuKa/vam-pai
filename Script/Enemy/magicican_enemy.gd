extends Enemy

var fly_point:Vector2
var start_pos:Vector2
var delay_fly = false
var push = false
var camp_position = Vector2.ZERO

@export var TIME_DELAY_SHOT = 2
var time_delay_shot = 0
var shot = false
var time_push = 0
func _ready():
	time_delay_shot = randf_range(0.5,TIME_DELAY_SHOT) + 1.5
	_set_state()
	start_pos = position
	fly_point = get_node("/root/game/fly_point").get_child(randi_range(0,7)).position

func _physics_process(delta):
	if get_node("/root/game/SpawnEnemyManager").mushroom_event == false:
		_delete()
	
	if move:
		position = position.lerp(camp_position,speed*delta)
	
	_shooting(delta)
	
	if time_hurt > 0:
		time_hurt -= delta
		$Sprite.modulate = Color(1.5, 1.5, 3)
		if time_hurt <= 0:
			$Sprite.modulate = Color(1, 1, 1)
	
	#⏰⏰⏰
	if time_push > 0: 
		time_push -= delta 
		position.y -= 0.5 * time_push/0.1
	if position.y >= 160:
		queue_free()

func _shooting(delta):
	if time_delay_shot > 0:
		time_delay_shot -= delta
	elif shot == false:
		$AnimationPlayer.play("attack")
		move = false
		shot = true
		await get_tree().create_timer(0.96).timeout
		push = true
		time_push = 0.2
		$shot._shoot()
		$AnimationPlayer.play("idle")
		await get_tree().create_timer(0.5).timeout
		time_delay_shot = TIME_DELAY_SHOT
		move = true
		shot = false
		push = false
	pass

func _take_damage(Damage):
	hp -= Damage
	time_hurt = 0.1
	if hp <= 0:
		_death()

func _death():
	_spawn_dust()
	_gem_drop()
	_soul_drop()
	queue_free()
	pass

func _delete():
	_spawn_dust()
	queue_free()
