extends Control

var id_list:Array = [0,0,0]
var name_items:Array = ["","",""]
var path_items:Array = ["","",""]
var number_items:Array = [0,0,0]

@onready var player_items = get_node("/root/game/player/Items")

func _ready():
	visible = false
	_spin()

func _spin():
	visible = true
	get_tree().paused = true
	name_items = ["","",""]
	path_items = ["","",""]
	for n in 3:
		id_list[n] = Item_list.get_random_id()
		print(">>>  :",id_list)
		get_node("slots/slot"+str(n)).texture_normal = Item_list.get_image(id_list[n])
		name_items[n] = Item_list.get_item_name(id_list[n])
		path_items[n] = Item_list.get_item_path(id_list[n])
	print_debug(">>>  :",name_items)
	set_number()
	pass

func set_number():
	var number_items:Array = [0,0,0]
	for n in 3:
		for i in 3:
			if name_items[n] == name_items[i]:
				number_items[n] += 1
	for n in 3:
		get_node("Numbers/number"+str(n)+"/color").text = str(number_items[n])
		get_node("Numbers/number"+str(n)+"/line").text = str(number_items[n])
	pass

func _slot_0_pressed():
	var number_slot = 0
	_pick_item(number_slot)
	pass # Replace with function body.

func _slot_1_pressed():
	var number_slot = 1
	_pick_item(number_slot)
	pass # Replace with function body.

func _slot_2_pressed():
	var number_slot = 2
	_pick_item(number_slot)
	pass # Replace with function body.

func _pick_item(Number_slot):
	visible = false
	get_tree().paused = false
	print("check_item:",name_items[Number_slot])
	if player_items.check_item(name_items[Number_slot]):
		player_items.plus_item(name_items[Number_slot])
	else :
		player_items.add_item(path_items[Number_slot])
	TheGame._reset_exp()
