extends Enemy

var time_shot = 3.0
var TIME_SHOT = 5

var camp_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_state()
	pass # Replace with function body.

func _process(delta):
	if death:
		_death()
	
	if time_shot > 0 :
		time_shot -= delta
	else :
		time_shot = TIME_SHOT
		_shot()
	
	if move:
		position = position.lerp(camp_position,speed*delta)
	
	position.y += TheGame.ROLL_SPEED * delta
	
	if time_hurt > 0:
		time_hurt -= delta
		$Sprite.modulate = Color(1.5, 1.5, 3)
		if time_hurt <= 0:
			$Sprite.modulate = Color(1, 1, 1)

func _death():
	_spawn_dust()
	_gem_drop()
	_soul_drop()
	queue_free()
	pass

func _shot():
	$AnimationPlayer.play("attack")
	await get_tree().create_timer(0.32).timeout
	$shot.shot()
	await get_tree().create_timer(0.56).timeout
	$AnimationPlayer.play("idle")
