extends Node2D

@onready var enemy1: PackedScene = load("res://enemy1.tscn")

var enemy_zones

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_zones = get_tree().get_nodes_in_group('enemyzone')
	for zone in enemy_zones:
		if not zone.selected:
			var new_enemy = enemy1.instantiate()
			new_enemy.global_position = zone.global_position
			add_child(new_enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
