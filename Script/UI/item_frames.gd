extends GridContainer

var player_items:PlayerItems
var items

func _ready():
	player_items = get_node("/root/game/player/Items")
	_arrange()

func _arrange():
	items = player_items.get_children()
	var i = 0
	for n in get_children():
		i += 1
		if i <= items.size():
			n.visible = true
			n.get_node("number_color").text = str(items[i-1].quantity)
			n.get_node("number_line").text = str(items[i-1].quantity)
			n.get_node("image").texture = items[i-1].image
		else :
			n.visible = false
	pass
