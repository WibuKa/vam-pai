extends CanvasLayer

func _ready():
	visible = true
	$Name.text = get_node("/root/game/player").NAME
	_set_level()
	pass # Replace with function body.

func _process(delta):
	_set_level()

func _set_level():
	$Level.text = "LV: " + str(get_node("/root/game/player").level)
