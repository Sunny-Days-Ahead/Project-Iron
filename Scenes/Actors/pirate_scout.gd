extends Node2D
func _ready() -> void:
	global_rotation_degrees = 180
func _process(delta: float) -> void:
	global_position.y += 50 * delta
