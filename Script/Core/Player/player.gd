extends Creature
class_name Player

@export var NAME = ""
var level = 0

var TIME_SHOT = 0.5
var time_hurt = 0
var shooting = false

func _ready():
	_set_stats()
	hp = HP

func _physics_process(delta):
	move_and_slide()

func _process(delta):
	_set_stats()
	
	if time_hurt > 0:
		time_hurt -= delta
	
func _hit(objet_):
	$Items._hit(objet_)
	pass

func _hurt():
	time_hurt = 0.5
	$Animation.play("hurt")

func _take_damage(Damage):
	hp -= Damage
	_hurt()

func _set_stats():
	#STATS# 📃
	HP = $state/stats.HP + $Items.HP
	DEF = $state/stats.DEF + $Items.DEF
	ATK = $state/stats.ATK + $Items.ATK
	M_ATK = $state/stats.M_ATK + $Items.M_ATK
	CRIT = $state/stats.CRIT + $Items.CRIT
	SPR = $state/stats.SPR + $Items.SPR
