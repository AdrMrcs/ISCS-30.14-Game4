extends Node2D

@onready var domino: PackedScene = load("res://Scenes/Characters/domino.tscn")
@onready var lorele: PackedScene = load("res://Scenes/Characters/lorele.tscn")
@onready var edward: PackedScene = load("res://Scenes/Characters/edward.tscn")

var player_zones
var characters

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_zones = get_tree().get_nodes_in_group('zone')
	characters = [domino.instantiate(), lorele.instantiate(), edward.instantiate()]
	assert(len(player_zones) == len(characters))
	
	# Load the 3 characters
	for i in range(len(player_zones)):
		var zone = player_zones[i]
		var character = characters[i]
		character.global_position = zone.global_position
		add_child(character)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
