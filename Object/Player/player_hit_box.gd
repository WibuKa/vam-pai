extends Area2D

func coll(hit):
	print("HITTTTTT")
	if hit.is_in_group("Enemy"):
		owner._take_damage(hit.get_parent().body_damage)
	pass
