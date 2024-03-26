extends Projectile
@onready var player =  get_node("/root/game/player")

func _ready():
	connect("area_entered",area_entered)

func _physics_process(delta):
	position -= SPEED * delta * direction
	if position.y < -208 or position.y > 15:
		_destroy()
	position.y += TheGame.ROLL_SPEED * delta

func area_entered(hit_box):
	if !hit_box.is_in_group("projectile"):
		var sub_text = ""
		if crit:
			sub_text = "!"
		DAMAGE *= damage_factor
		if MAGIC > 0:
			Effect._float_number(str(MAGIC) + sub_text,global_position - Vector2(0,18),Color(0.3411,0.847,0.949))
		if DAMAGE > 0:
			Effect._float_number(str(DAMAGE) + sub_text,global_position - Vector2(0,10),Color.WHITE)
		hit_box._take_damage(DAMAGE + MAGIC)
		player._hit(hit_box.get_parent())
		_hit_effect("res://Object/Graphic/Effect/slash.tscn",hit_box.global_position)
		_destroy()
	pass

func _destroy():
	if destroy:
		queue_free()
	pass
