extends Node
class_name Item
var activate = false
@export var image:Texture
@export var item_name = ""
@export var quantity = 1
@export_enum("Common","Uncommon","Rare","Epic","Mythic") var tiers = "Common"

@export_subgroup("stats")
@export var HP = 0
@export var DEF = 0
@export var ATK = 0
@export var M_ATK = 0
@export var CRIT = 0
@export var SPR = 0

@export_subgroup("note")
@export_multiline var stats:String = ""
@export_multiline var Passive:String = ""
@export_multiline var lore:String = ""

