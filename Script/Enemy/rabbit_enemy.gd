extends Enemy

@export var TIME_DELAY_ATTACK = 0.5
var time_delay_attack = 0
var attack = false
var riding = true
var jump_out_chicken = false
var attack_direction = Vector2.ZERO
func _ready():
	_set_state()
	player = get_node("/root/game/player")
	time_delay_attack = 0.1

func _physics_process(delta):
	if position.y >= -140 and jump_out_chicken == false:
		_jump_out_chiken()
	
	if position.y < -140 :
		position.y += speed * delta
	
	if riding:
		$chicken.frame = $Sprite.frame
	
	if time_hurt > 0:
		time_hurt -= delta
		$Sprite.modulate = Color(1.5, 1.5, 3)
		if time_hurt <= 0:
			$Sprite.modulate = Color(1, 1, 1)
	
	if position.y >= 160 :
		queue_free()
	
	#timer
	if riding == false:
		if time_delay_attack > 0 and attack == false:
			time_delay_attack -= delta
			$AnimationPlayer.play("idle")
		elif attack == false:
			attack = true
			$AnimationPlayer.play("attack")
			await get_tree().create_timer(0.96).timeout
			attack_direction = position.direction_to(player.position + Vector2(randi_range(-16,16),randi_range(-16,16)))
			$thorn_ball.throw = true
			$thorn_ball.direction = attack_direction

func _recall():
	time_delay_attack = TIME_DELAY_ATTACK
	$AnimationPlayer.play("recall")
	await get_tree().create_timer(0.2).timeout
	attack = false

func _take_damage(Damage):
	hp -= Damage
	time_hurt = 0.1
	if hp <= 0:
		_death()

func _death():
	get_node("/root/game/SpawnEnemyManager").kill_rabbit += 1;
	await get_tree().create_timer(0.1).timeout
	queue_free()
	_gem_drop()
	_soul_drop()
	pass

func _spawn_chicken():
	var Load = load("res://Object/Enemy/chicken.tscn")
	var chicken = Load.instantiate()
	get_node("/root/game").add_child(chicken)
	chicken.position = position + Vector2(0,16)
	pass

func _jump_out_chiken():
	jump_out_chicken = true
	$chicken.visible = false
	_spawn_chicken()
	$AnimationPlayer.play("jump")
	await get_tree().create_timer(0.4).timeout
	$AnimationPlayer.play("recovery")
	await get_tree().create_timer(0.05).timeout
	riding = false
