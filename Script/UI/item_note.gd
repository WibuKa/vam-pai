extends Control
class_name ItemNote

var name_item = ""
var stats = ""
#stats
var HP = 0
var DEF = 0
var ATK = 0
var M_ATK = 0
var CRIT = 0

func _ready():
	_print()

func _print():
	$name_item/Text.text = name_item
	stats = ""
	if HP != 0:
		stats += "\n"
		stats += "+ " + str(HP) + " health"
	if DEF != 0:
		stats += "\n"
		stats += "+ " + str(DEF) + " armor"
	if ATK != 0:
		stats += "\n"
		stats += "+ " + str(ATK) + " attack damage"
	if M_ATK != 0:
		stats += "\n"
		stats += "+ " + str(M_ATK) + " ability power"
	if CRIT != 0:
		stats += "\n"
		stats += "+ %" + str(CRIT) + " critical Chance"
	$stats/Text.text = stats
