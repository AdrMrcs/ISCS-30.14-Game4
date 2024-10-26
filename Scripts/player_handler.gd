extends Node2D

@onready var player1: PackedScene = load("res://Scenes/player1.tscn")

var player_zones

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_zones = get_tree().get_nodes_in_group('zone')
	for zone in player_zones:
		if not zone.selected:
			var new_player = player1.instantiate()
			new_player.global_position = zone.global_position
			add_child(new_player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
