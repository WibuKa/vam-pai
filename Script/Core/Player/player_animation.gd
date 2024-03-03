extends Node

@export var body:Sprite2D
@export var leg_animation:AnimationPlayer
@export var body_animation:AnimationPlayer


func _attack():
	body_animation.play("attack")
	pass

func _walk():
	leg_animation.play("walk")
	pass
