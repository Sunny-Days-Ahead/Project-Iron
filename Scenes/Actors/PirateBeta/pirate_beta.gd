extends Node2D

@export var points : int = 1
@export var speed : float = 50.0

func _ready() -> void:
	global_rotation_degrees = 180
	
func _process(delta: float) -> void:
	global_position.y += speed * delta

func _on_health_component_died() -> void:
	var scoreNode : Label = Global.ui_node.find_child("Score")
	
	if scoreNode.has_method("addScore"):
		scoreNode.addScore(points)

	queue_free()
