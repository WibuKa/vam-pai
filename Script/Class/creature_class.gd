extends CharacterBody2D
class_name Creature

@export_subgroup("Stats")
@export var SPEED:int
@export var HP = 0
@export var DEF = 0
@export var ATK = 0
@export var M_ATK = 0
@export var CRIT = 0
@export var SPR = 0

@export_subgroup("Other")
@export var move = true
@export var can_slow = true

var hp = 0
