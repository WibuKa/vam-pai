extends CharacterBody2D
class_name Player

var SPEED = 250.0
var TIME_SHOT = 0.1

func _physics_process(delta):
	
	move_and_slide()
