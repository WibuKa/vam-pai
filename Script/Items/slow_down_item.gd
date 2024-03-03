extends Item
@export var image:Texture

@export_subgroup("Effect")
@export var time_slow = 0.0
@export var percent = 0

func _hit(objet):
	objet._slow(percent,time_slow)
	pass
