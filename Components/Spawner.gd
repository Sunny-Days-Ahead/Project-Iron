@icon("res://Assets/Icons/riposte.svg")
class_name Spawner
extends Timer

@export var sceneToSpawn : PackedScene
@export var siblingOf : Node2D
@export var spawnPosition : Vector2 = Global.OUT_OF_BOUNDS
@export var spawnAngle : float = 0.0
@export var autoSpawn : bool

var canSpawn : bool = true

func _ready() -> void:
	timeout.connect(_on_spawner_timeout)
	
	if autoSpawn:
		autostart = true
		start()
	
func _on_spawner_timeout() -> void:
	canSpawn = true
	
	if autoSpawn:
		spawn()

func spawn() -> void:
	var newEntity = sceneToSpawn.instantiate()
	
	newEntity.global_rotation_degrees = spawnAngle
	
	if spawnPosition != Global.OUT_OF_BOUNDS:
		newEntity.global_position = spawnPosition
	else:
		newEntity.global_position = siblingOf.global_position
	
	siblingOf.get_parent().add_child(newEntity)

	canSpawn = false
