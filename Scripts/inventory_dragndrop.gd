extends Node2D

@onready var inv_handler = get_tree().get_first_node_in_group('inventory_handler')

var selected = false
var rest_point
var current_zone
var start_zone
var inventoryzones = []
var playerzones = []
var inv_size = 4

func _ready():
	inventoryzones = get_tree().get_nodes_in_group("inventoryzone")
	playerzones = get_tree().get_nodes_in_group("zone")

func add(zone: Node2D, type: int):
	rest_point = zone.global_position
	start_zone = zone
	current_zone = zone
	zone._select()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
	else:
		global_position = lerp(global_position, rest_point, 10 * delta	)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 75
			for zone in playerzones:
				var distance = global_position.distance_to(zone.global_position)
				if distance < shortest_dist and not zone.selected:
					zone._select()
					current_zone._deselect()
					rest_point = zone.global_position
					shortest_dist = distance
					current_zone = zone
					inv_handler.refresh(start_zone)
