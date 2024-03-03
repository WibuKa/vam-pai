extends CharacterBody2D
class_name Player

var SPEED = 180.0
var TIME_SHOT = 0.5
var HP = 0
var DEF = 0
var ATK = 0
var M_ATK = 0
var CRIT = 0
var SPR = 0

var time_hurt = 0

func _physics_process(delta):
	move_and_slide()

func _process(delta):
	#STATS# 📃
	HP = $state/stats.HP + $Items.HP
	DEF = $state/stats.DEF + $Items.DEF
	ATK = $state/stats.ATK + $Items.ATK
	M_ATK = $state/stats.M_ATK + $Items.M_ATK
	CRIT = $state/stats.CRIT + $Items.CRIT
	SPR = $state/stats.SPR + $Items.SPR
	
	if time_hurt > 0:
		time_hurt -= delta
	
func _hit(objet_):
	$Items._hit(objet_)
	pass

func _hurt():
	time_hurt = 0.5
	$Animation.play("hurt")

func _take_damage(Damage):
	HP -= Damage
	_hurt()
