extends Area2D

func _ready():
	connect("area_entered",coll)

func _take_damage(Damage):
	owner._take_damage(Damage)

func coll(area):
	if area.is_in_group("area_damage"):
		owner._take_damage(area.damage)
	pass
