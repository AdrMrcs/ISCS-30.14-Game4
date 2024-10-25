extends Marker2D

func _draw():
	draw_circle(Vector2.ZERO, 20, Color.LIGHT_SALMON)
	
func _select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	modulate = Color.WEB_MAROON
		
func deselect():
	modulate = Color.WHITE
