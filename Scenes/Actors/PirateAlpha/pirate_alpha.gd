extends Path2D

@export var points : int = 1
@export var speed : float = 100.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%PirateAlpha.progress += speed * delta

func _on_health_component_died() -> void:
	var scoreNode : Label = Global.ui_node.find_child("Score")
	
	if scoreNode.has_method("addScore"):
		scoreNode.addScore(points)

	queue_free()
