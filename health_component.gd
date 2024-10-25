extends Node2D

@onready var healthbar: ProgressBar = $HealthBar

@export var max_health = 100
var hp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = max_health
	
	healthbar.global_position = get_parent().global_position + Vector2(-30, 40)
	healthbar.max_value = hp
	healthbar.value = hp


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func damage(attack):
	hp -= attack
	healthbar.value = hp
