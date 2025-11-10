@icon("res://Assets/Icons/riposte.svg")
class_name Spawner
extends Timer

@export var sceneToSpawn : PackedScene
@export var targetParent : Node
@export var startPosition : Vector2

func _ready() -> void:
	timeout.connect(_on_spawner_timeout)
	
func _on_spawner_timeout() -> void:
	var newEntity = sceneToSpawn.instantiate()
	
	if startPosition != null:
		newEntity.global_position = startPosition
	
	targetParent.add_child(newEntity)
