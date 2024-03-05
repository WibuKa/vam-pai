extends Node2D
class_name Maint

func _clear():
	#Gems
	for n in $Drop/Gems.get_children():
		if n.position.y >= 50:
			n.queue_free()
