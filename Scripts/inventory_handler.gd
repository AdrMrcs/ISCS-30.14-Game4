extends Node2D

@onready var inventory: PackedScene = load("res://Scenes/inventory_dragndrop.tscn")
@onready var inv_zones = get_tree().get_first_node_in_group('inventory_zones')
@onready var zone: PackedScene = load("res://Scenes/inventoryzone.tscn")

var inventory_zones = []
var inv_size = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_zones()
	inventory_zones = get_tree().get_nodes_in_group("inventoryzone")
	for zone in inventory_zones:
		var new_inv = inventory.instantiate()
		new_inv.add(zone, 0)
		add_child(new_inv)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_zones():
	for i in range(1, inv_size+1):
		var new_zone = zone.instantiate()
		new_zone.global_position = Vector2(i*150, 100)
		inv_zones.add_child(new_zone)

func refresh(zone: Node2D):
	var new_inv = inventory.instantiate()
	new_inv.add(zone, 0)
	add_child(new_inv)
