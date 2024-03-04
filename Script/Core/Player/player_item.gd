extends Node
class_name PlayerItems
var name_list = []

var HP = 0
var DEF = 0
var ATK = 0
var M_ATK = 0
var CRIT = 0
var SPR = 0

func _ready():
	set_list_name()

func _process(delta):
	HP = 0
	DEF = 0
	ATK = 0
	M_ATK = 0
	CRIT = 0
	SPR = 0
	
	for n in get_children():
		HP += n.HP * n.quantity
		DEF += n.DEF * n.quantity
		ATK += n.ATK * n.quantity
		M_ATK += n.M_ATK * n.quantity
		CRIT += n.CRIT * n.quantity
		SPR += n.SPR * n.quantity

func set_list_name():
	name_list = []
	for n in get_children():
		name_list.append(n.item_name)
	print(name_list)
	pass

func check_item(Name):
	var Has = false
	if Name in name_list:
		Has = true
	return Has



func plus_item(Item_Name:String,quantity:int):
	for n in get_children():
		if n.item_name == Item_Name:
			n.quantity += quantity
			print("plus item: ",n.quantity)
			break
	get_node("/root/game/CanvasLayer/Inventory/ItemFrames")._arrange()

func add_item(Item_path:String,quantity:int):
	print("add item: ",Item_path)
	var Load = load(Item_path)
	var Item_ = Load.instantiate()
	add_child(Item_)
	Item_.activate = true
	Item_.quantity = quantity
	set_list_name()
	get_node("/root/game/CanvasLayer/Inventory/ItemFrames")._arrange()

func _hit(objet_):
	for n in get_children():
		n._hit(objet_)
	pass
