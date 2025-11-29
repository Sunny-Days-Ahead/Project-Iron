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

## If set, this function is called when spawning an entity. It must take the spawned node as its only parameter.
var spawnFunction : Callable = Callable()
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

## Try to spawn the scene if the timer/delay is OK. The spawnAction is optionally called and must take the spawned node as its only parameter.
## If nothing is set, the spawnFunction Callable is used. If that is also not set, no function is called.
## Returns true if spawned, false if not.
func try_spawn(spawnAction : Callable = spawnFunction) -> bool:
	if canSpawn:
		spawn(spawnAction)
		return true
	else:
		return false

## Spawn the scene immediately. The spawnAction is optionally called and must take the spawned node as its only parameter.
## If nothing is set, the spawnFunction Callable is used. If that is also not set, no function is called.
func spawn(spawnAction : Callable = spawnFunction) -> void:
	var newEntity = sceneToSpawn.instantiate()
	
	newEntity.global_position = spawnPosition.global_position
	
	if spawnAction.is_valid():
		spawnAction.call(newEntity)
	
	spawnPosition.call_deferred("add_child", newEntity)
	spawned.emit(newEntity)
	
	canSpawn = false
	start()
