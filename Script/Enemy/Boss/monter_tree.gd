extends Enemy

var idle = true

var TIME_DELAY_ROOT = 5
var time_delay_root = 5

var TIME_DELAY_SHOT = 10
var time_delay_shot = 7.5

var time_end_shot = 0

var time_shot = 0

var shot = false

var roots:Array[Projectile]

func _ready():
	$animation_body.play("idle")
	$animation_head.play("idle")
	roots.resize(10)
	_set_state()

func _process(delta):
	#timer
	if time_delay_root > 0:
		time_delay_root -= delta
	else :
		time_delay_root = TIME_DELAY_ROOT
		$animation_body.play("root_attack")
		await get_tree().create_timer(0.25).timeout
		_root_attack()
	
	if time_delay_shot > 0:
		time_delay_shot -= delta
	else :
		time_end_shot = 3.5
		time_delay_shot = TIME_DELAY_SHOT
		$animation_head.play("attack")
		await get_tree().create_timer(0.35).timeout
		shot = true
		
	if shot:
		if time_shot > 0:
			time_shot -= delta
		else :
			$head.frame = 24
			time_shot = 0.33
			for n in $guns.get_children():
				n._shoot()
			await get_tree().create_timer(0.1).timeout
			$head.frame = 23
			
		
		if time_end_shot > 0:
			time_end_shot -= delta
		else :
			shot = false
			$animation_head.play("idle")
	
	animation()
	if time_hurt > 0:
		time_hurt -= delta
		$body.modulate = Color(1.5, 1.5, 3)
		$head.modulate = Color(1.5, 1.5, 3)
		if time_hurt <= 0:
			$head.modulate = Color(1, 1, 1)
			$body.modulate = Color(1, 1, 1)
	
	position.y += TheGame.ROLL_SPEED * delta * 2

func animation():
	pass

func _root_attack():
	for n in 8:
		var Root = _spawn("res://Object/Bullet/root.tscn",Vector2(randi_range(-54,54),randi_range(30,-30)))
		roots[n] = Root
	await get_tree().create_timer(2.5).timeout
	for i in 8:
		if roots[i] != null:
			roots[i].queue_free()
	$animation_body.play("idle")
	pass

func _spawn(path:String,position_spawn:Vector2):
	var Load = load(path)
	var Obj = Load.instantiate()
	get_node("/root/game").add_child(Obj)
	Obj.position = position_spawn
	return Obj
	pass

func _death():
	get_node("/root/game/SpawnEnemyManager").kill_boss = true;
	await get_tree().create_timer(0.1).timeout
	queue_free()
	_gem_drop()
	_soul_drop()
	pass
