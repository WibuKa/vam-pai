extends Node2D
class_name Maint

func _ready():
	TheGame.player = %player
	TheGame.ROLL_SPEED = 20

func _clear():
	#Gems
	for n in $Drop/Gems.get_children():
		if n.position.y >= 50:
			n.queue_free()
