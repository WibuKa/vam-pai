extends Node2D

var number = "00"
var color:Color
func _ready():
	$number/line.text = str("")
	$number/color.text = str("")
	await get_tree().create_timer(3).timeout
	queue_free()

func _process(delta):
	$number/line.text = str(number)
	$number/color.text = str(number)
	$number/color.modulate = color
