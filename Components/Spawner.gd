@icon("res://Assets/Icons/riposte.svg")
class_name Spawner
extends Timer

## Emitted when the scene is spawned. Entity contains a reference to the node spawned.
signal spawned(entity : Node)

## Scene to Spawn
@export var sceneToSpawn : PackedScene

## Scene will be spawned as a child of this Marker2D
@export var spawnPosition : Marker2D

## When true, spawns automatically when timer complete.
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

func try_spawn() -> void:
	if canSpawn:
		spawn()

func spawn() -> void:
	var newEntity = sceneToSpawn.instantiate()
	
	newEntity.global_position = spawnPosition.global_position
	spawnPosition.add_child(newEntity)
	spawned.emit(newEntity)
	
	canSpawn = false
	start()
