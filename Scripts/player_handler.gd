extends Node2D

@onready var domino: PackedScene = load("res://Scenes/Characters/domino.tscn")
@onready var lorele: PackedScene = load("res://Scenes/Characters/lorele.tscn")
@onready var edward: PackedScene = load("res://Scenes/Characters/edward.tscn")

var player_zones
var characters = [domino, lorele, edward] # CHARACTER SCENES

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_zones = get_tree().get_nodes_in_group('zone')
	for zone in player_zones:
		if not zone.selected:
			var new_player = lorele.instantiate()
			new_player.global_position = zone.global_position
			add_child(new_player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
