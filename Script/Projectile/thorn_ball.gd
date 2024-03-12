extends Projectile

@export var wire:Line2D
@export var anchorage:Node2D
var throw = false
var recall = false
var acce = 1

func _ready():
	visible = false
	connect("area_entered",area_entered)

func _physics_process(delta):
	if throw:
		visible = true
		acce -= delta
		if global_position.y >= 0 or abs(global_position.x) > 75:
			throw = false
			acce = 1
			recall = true
		position += direction * SPEED * delta * acce
	
	elif recall:
		position = position.move_toward(anchorage.position,SPEED * delta)
		if position.distance_to(anchorage.position) <= 5:
			position = anchorage.position
			owner._recall()
			recall = false
			visible = false
	
	wire.points[1] = anchorage.position
	wire.points[0] = position

func area_entered(hit_box):
	if !hit_box.is_in_group("projectile"):
		DAMAGE *= damage_factor
		if MAGIC > 0:
			Effect._float_number("-"+ str(MAGIC),global_position - Vector2(0,18),Color(0.3411,0.847,0.949))
		if DAMAGE > 0:
			Effect._float_number("-"+str(DAMAGE),global_position - Vector2(0,10),Color(1,0.270,0.2705))
		hit_box._take_damage(DAMAGE + MAGIC)
	pass
