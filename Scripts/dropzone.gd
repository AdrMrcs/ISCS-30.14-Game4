extends Marker2D

@export var selected = false
var is_debug = true

func _draw():
	if is_debug:
		draw_circle(Vector2.ZERO, 20, Color.LIGHT_SALMON)
	
func _select():
	modulate = Color.WEB_MAROON
	selected = true
		
func _deselect():
	modulate = Color.WHITE
	selected = false
