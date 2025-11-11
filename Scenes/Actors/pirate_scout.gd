extends Node2D
func _ready() -> void:
	global_rotation_degrees = 180
func _process(delta: float) -> void:
	global_position.y += 50 * delta


func _on_health_component_died() -> void:
	var scoreNode : Label = Global.ui_node.find_child("Score")
	
	if scoreNode.has_method("addScore"):
		scoreNode.addScore(1)

	queue_free()
