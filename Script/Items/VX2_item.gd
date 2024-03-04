extends Item

@export_file(".tscn") var projectiles
@onready var player = owner
var angle = 60
var direction

func _ready():
	direction = Vector2(cos(deg_to_rad(angle)),sin(deg_to_rad(angle)))

func _process(delta):
	if player.shooting:
		_spawn_bullet()

func _spawn_bullet():
	await get_tree().create_timer(0.1).timeout
	var Bullet_load = load(projectiles)
	var i = [1,-1]
	for n in 2:
		var Bullet = Bullet_load.instantiate()
		get_node("/root/game").add_child(Bullet)
		Bullet.direction = direction * Vector2(i[n],1)
		Bullet.rotation_degrees = -angle/2 * i[n]
		Bullet.position = player.position
		Bullet.DAMAGE = player.ATK/2
		Bullet.MAGIC = player.M_ATK/2
	pass

func _hit(objet):
	pass
