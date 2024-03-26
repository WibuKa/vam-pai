extends Node
const y_spawn = -250
var TEST = false

var TIME_DELAY_ONION = 10
var time_delay_onion = 0

var TIME_DELAY_BAT = 15
var time_delay_bat = 5

var TIME_DELAY_SKULL = 22
var time_delay_skull = 10

var time_delay_rabbit = 45
var time_delay_boss = 9999

var time_end_mus_even = 20

var time_spawn_mus = 0
var time_delay_mushroom = 25
var time_delay_book = 30

var rabbit_event = false
var kill_rabbit = 0
var boss_event = false
var kill_boss = false
var mushroom_event = false

func _ready():
	pass

func _process(delta):
	if rabbit_event == false and boss_event == false and mushroom_event == false:
		if time_delay_boss > 0:
			time_delay_boss -= delta
			if time_delay_boss <= 0:
				boss_event = true
				_boss_event()
				await get_tree().create_timer(2.2).timeout
				TheGame.ROLL_SPEED = 0
		
		if time_delay_book > 0:
			time_delay_book -= delta
			if time_delay_book <= 0:
				_book_monster()
		
		if time_delay_onion <= 0:
			_onion_army()
			time_delay_onion = TIME_DELAY_ONION
		else :
			time_delay_onion -= delta
		
		if time_delay_skull <= 0:
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
		
		if time_delay_mushroom > 0:
			time_delay_mushroom -= delta
			if  time_delay_mushroom <= 0:
				mushroom_event = true
				_magician_mus()
	
	if mushroom_event:
		if time_spawn_mus > 0:
			time_spawn_mus -= delta
		else :
			time_spawn_mus = randf_range(0,2)
			_mus_spawn()
		
		if time_end_mus_even > 0:
			time_end_mus_even -= delta
			if time_end_mus_even <= 0:
				mushroom_event = false
		pass
	
	if boss_event:
		if kill_boss:
			TheGame._reset()
			pass
	
	if rabbit_event:
		if kill_rabbit == 2:
			rabbit_event = false
			kill_rabbit = 0
			await get_tree().create_timer(1.5).timeout
			TheGame.ROLL_SPEED = 20
	
	if time_delay_bat <= 0:
		_bat_army()
		time_delay_bat = TIME_DELAY_BAT
	else :
		time_delay_bat -= delta

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
			_spawn_enemy("res://Object/Enemy/skull_fire.tscn",Vector2(-52 + 25 * n,y_spawn + 16),0) 
	else :
		for n in 3:
			_spawn_enemy("res://Object/Enemy/skull_fire.tscn",Vector2(-52,y_spawn + 25 * n),0) 
		for n in 3:
			_spawn_enemy("res://Object/Enemy/skull_fire.tscn",Vector2(52,y_spawn + 25 * n),0) 
	
func _bat_army():
	var rand_pos = [-56,-15].pick_random()
	for n in 4:
		_spawn_enemy("res://Object/Enemy/bat.tscn",Vector2(rand_pos + 20 * n,y_spawn),0) 

func _boss_event():
	_spawn_enemy("res://Object/Boss/monster_tree.tscn",Vector2(0,y_spawn),0)
	pass

func _rabbit_army():
	_spawn_enemy("res://Object/Enemy/rabit.tscn",Vector2(-30,y_spawn - 250),0) 
	_spawn_enemy("res://Object/Enemy/rabit.tscn",Vector2(30,y_spawn - 250),0) 
	_spawn_enemy("res://Object/Enemy/chicken.tscn",Vector2([-55,55,0].pick_random(),y_spawn - 255),0)

func _magician_mus():
	_spawn_enemy("res://Object/Enemy/magician_mushroom.tscn",Vector2(0,y_spawn),0).camp_position = Vector2(32,-138) 
	_spawn_enemy("res://Object/Enemy/magician_mushroom.tscn",Vector2(0,y_spawn),0).camp_position = Vector2(0,-138) 
	_spawn_enemy("res://Object/Enemy/magician_mushroom.tscn",Vector2(0,y_spawn),0).camp_position = Vector2(-32,-138) 

func _mus_spawn():
	_spawn_enemy("res://Object/Enemy/moyai_mushroom.tscn",Vector2(randi_range(-55,55),y_spawn),0)

func _book_monster():
	_spawn_enemy("res://Object/Enemy/book_monster.tscn",Vector2(100,-192),0).camp_position = Vector2(32,-138) 
	_spawn_enemy("res://Object/Enemy/book_monster.tscn",Vector2(-100,-192),0).camp_position = Vector2(-32,-138) 

func _spawn_enemy(path:String,position_spawn:Vector2,time_delay:float):
	var enemy_load = load(path)
	var enemy = enemy_load.instantiate()
	%Enemy.add_child(enemy)
	enemy.position = position_spawn
	enemy.time_delay_spawn = time_delay
	return enemy

