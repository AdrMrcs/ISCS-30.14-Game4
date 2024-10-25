extends Node2D

@onready var inventory: PackedScene = load("res://inventory_dragndrop.tscn")

var inventory_zones = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory_zones = get_tree().get_nodes_in_group('inventoryzone')
	for i in inventory_zones.size():
		var new_inv = inventory.instantiate()
		add_child(new_inv)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
