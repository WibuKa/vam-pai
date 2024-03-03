extends Node


func get_image(id:int):
	var image = get_child(id).image
	print(id)
	return image

func get_item_name(id:int):
	var Name = get_child(id).item_name
	print(Name)
	return Name

func get_item_path(id:int):
	var path = get_child(id).scene_file_path
	return path

func get_random_id():
	var id = randi_range(0,get_child_count()-1)
	return id
