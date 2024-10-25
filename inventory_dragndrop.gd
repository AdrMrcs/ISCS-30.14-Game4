extends Node2D

@onready var icon: Sprite2D = $Icon

var selected = false
var rest_point
var init_point
var inventoryzones = []
var playerzones = []

func _ready():
	inventoryzones = get_tree().get_nodes_in_group("inventoryzone")
	playerzones = get_tree().get_nodes_in_group("zone")
	for zone in inventoryzones:
		if not zone.selected:
			rest_point = zone.global_position
			init_point = rest_point
			$IdleIcon.global_position = rest_point
			zone._select()
			break

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		
func _physics_process(delta):
	if selected:
		icon.global_position = lerp(icon.global_position, get_global_mouse_position(), 25 * delta)
	else:
		icon.global_position = lerp(icon.global_position, rest_point, 10 * delta	)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 75
			for zone in playerzones:
				var distance = icon.global_position.distance_to(zone.global_position)
				if distance < shortest_dist and not zone.selected:
					zone._select()
					rest_point = zone.global_position
					shortest_dist = distance
					
func _return():
	icon.global_position = lerp(icon.global_position, init_point, 40)
