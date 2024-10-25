extends Node2D

var attacks = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attacks = [
		1, 
	]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func attack_target(target: Node2D, index: int):
	target.health.damage(attacks[index])
