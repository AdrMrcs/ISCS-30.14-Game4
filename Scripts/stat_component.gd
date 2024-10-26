extends Node2D

var type = 0
var hp
var attack
var defense
var speed

var stats = [
	[50, 100, 50, 100], 
	[100, 50, 100, 50] 
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_stats()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_stats():
	hp = stats[type][0]
	attack = stats[type][1]
	defense = stats[type][2]
	speed = stats[type][3]
	print (hp, attack, defense, speed)
