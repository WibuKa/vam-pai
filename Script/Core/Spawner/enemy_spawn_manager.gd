extends Node
const y_spawn = -250
var TEST = false
var TIME_DELAY_ONION = 10
var time_delay_onion = 0

var TIME_DELAY_BAT = 15
var time_delay_bat = 5

var TIME_DELAY_SKULL = 22
var time_delay_skull = 10

var time_delay_rabbit = 10

var rabbit_event = false
var kill_rabbit = 0

func _process(delta):
	if time_delay_onion <= 0:
		if rabbit_event == false:
			_onion_army()
			time_delay_onion = TIME_DELAY_ONION
	else :
		time_delay_onion -= delta
	
	if time_delay_bat <= 0:
		if rabbit_event == false:
			_bat_army()
			time_delay_bat = TIME_DELAY_BAT
	else :
		time_delay_bat -= delta
	
	if time_delay_skull <= 0:
		if rabbit_event == false:
			_skull_army()
			time_delay_skull = TIME_DELAY_SKULL
	else :
		time_delay_skull -= delta
	
	if time_delay_rabbit > 0:
		time_delay_rabbit -= delta
		if time_delay_rabbit <= 0:
			print("_rabbit_army")
			_rabbit_army()
			rabbit_event = true
			await get_tree().create_timer(1).timeout
			TheGame.ROLL_SPEED = 0
	
	if rabbit_event:
		if kill_rabbit == 2:
			rabbit_event = false
			kill_rabbit = 0
			await get_tree().create_timer(1.5).timeout
			TheGame.ROLL_SPEED = 20

func _onion_army():
	var rand_type = randi_range(1,3)
	var rand_x = randi_range(-40,40)
	var ran_dir = [1,-1].pick_random()
	if rand_type == 1:
		for n in 5:
			await get_tree().create_timer(0.5).timeout
			_spawn_enemy("res://Object/Enemy/onion.tscn",Vector2(rand_x,y_spawn),0).direction.x = ran_dir
	elif rand_type == 2 :
		for n in 3:
			await get_tree().create_timer(0.5).timeout
			_spawn_enemy("res://Object/Enemy/onion.tscn",Vector2(0,y_spawn),0).direction.x = 1
			_spawn_enemy("res://Object/Enemy/onion.tscn",Vector2(0,y_spawn),0).direction.x = -1
	else :
		for n in 5:
			ran_dir = 1
			var ran_ = randi_range(0,1)
			rand_x = randi_range(-40,40)
			if ran_ == 0:
				ran_dir = -1
			await get_tree().create_timer(0.5).timeout
			_spawn_enemy("res://Object/Enemy/onion.tscn",Vector2(rand_x,y_spawn),0).direction.x = ran_dir

func _skull_army():
	var rand_type = [0,1].pick_random()
	if rand_type == 0:
		for n in 5:
			_spawn_enemy("res://Object/Enemy/skull_fire.tscn",Vector2(-52 + 25 * n,y_spawn),0) 
	else :
		for n in 3:
			_spawn_enemy("res://Object/Enemy/skull_fire.tscn",Vector2(-52,y_spawn + 25 * n),0) 
		for n in 3:
			_spawn_enemy("res://Object/Enemy/skull_fire.tscn",Vector2(52,y_spawn + 25 * n),0) 
	
func _bat_army():
	var rand_pos = [-56,-15].pick_random()
	for n in 4:
		_spawn_enemy("res://Object/Enemy/bat.tscn",Vector2(rand_pos + 25 * n,y_spawn),0) 

func _rabbit_army():
	_spawn_enemy("res://Object/Enemy/rabit.tscn",Vector2(-30,y_spawn - 250),0) 
	_spawn_enemy("res://Object/Enemy/rabit.tscn",Vector2(30,y_spawn - 250),0) 
	_spawn_enemy("res://Object/Enemy/chicken.tscn",Vector2([-55,55,0].pick_random(),y_spawn - 255),0)

func _spawn_enemy(path:String,position_spawn:Vector2,time_delay:float):
	var enemy_load = load(path)
	var enemy = enemy_load.instantiate()
	%Enemy.add_child(enemy)
	enemy.position = position_spawn
	enemy.time_delay_spawn = time_delay
	return enemy

