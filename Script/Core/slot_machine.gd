extends Control

var id_list:Array = [0,0,0]
var name_items:Array = ["","",""]
var path_items:Array = ["","",""]
var number_items:Array = [0,0,0]

@export var item_note:ItemNote

@onready var player_items = get_node("/root/game/player/Items")

func _ready():
	visible = false

func _spin():
	$slots.visible = false
	$Numbers.visible = false
	visible = true
	get_tree().paused = true
	name_items = ["","",""]
	path_items = ["","",""]
	for n in 3:
		id_list[n] = Item_list.get_random_id()
		get_node("slots/slot"+str(n)).texture_normal = Item_list.get_image(id_list[n])
		name_items[n] = Item_list.get_item_name(id_list[n])
		path_items[n] = Item_list.get_item_path(id_list[n])
	set_number()
	random_animation()
	pass

func random_animation():
	$hint_slots.visible = true
	for n in 6:
		for m in 3:
			get_node("hint_slots/slot"+str(m)).texture = Item_list.get_random_image()
		await get_tree().create_timer(0.08).timeout
	$hint_slots.visible = false
	$slots.visible = true
	$Numbers.visible = true

func set_number():
	number_items = [0,0,0]
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
	if player_items.check_item(name_items[Number_slot]):
		player_items.plus_item(name_items[Number_slot],number_items[Number_slot])
	else :
		player_items.add_item(path_items[Number_slot],number_items[Number_slot])
		print("slot_machine >>",number_items)
	$"../item_note".visible = false

func _slot_0_mouse_entered():
	var number_slot = 0
	_item_node(id_list[number_slot],name_items[number_slot])
	pass # Replace with function body.
func _slot_1_mouse_entered():
	var number_slot = 1
	_item_node(id_list[number_slot],name_items[number_slot])
	pass # Replace with function body.
func _slot_2_mouse_entered():
	var number_slot = 2
	_item_node(id_list[number_slot],name_items[number_slot])
	pass # Replace with function body.

func _item_node(id,name_item:String):
	$"../item_note".visible = true
	$"../item_note".name_item = name_item
	$"../item_note".HP = Item_list.get_child(id).HP
	$"../item_note".DEF = Item_list.get_child(id).DEF
	$"../item_note".ATK = Item_list.get_child(id).ATK
	$"../item_note".M_ATK = Item_list.get_child(id).M_ATK
	$"../item_note".CRIT = Item_list.get_child(id).CRIT
	$"../item_note"._print()
