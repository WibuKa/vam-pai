extends Control

func _process(delta):
	$number_color.text = str(TheGame.coin)
	$number_line.text = str(TheGame.coin)
	pass
