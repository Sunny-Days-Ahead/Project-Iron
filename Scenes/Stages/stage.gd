class_name Stage
extends Node

@export_category("Parallax Option")
@export var parallax_on_pause: bool = true

@export_category("Containers")
@export var enemy_container: Node
@export var bullet_container: Node

@export_category("Next Stage")
@export var nextStage : PackedScene
@export var stageTitle : String

# List of Enemy Spawn points
var newSpawn : Array[Marker2D]

# Reference to the Game UI
var gameUI: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameUI = get_tree().get_first_node_in_group("game_ui")
	gameUI.intro_finished.connect(_on_intro_finished)

	if parallax_on_pause:
		%BGParallax.process_mode = Node.PROCESS_MODE_ALWAYS
	else:
		%BGParallax.process_mode = Node.PROCESS_MODE_PAUSABLE

# Populate the list of Enemy Spawn points
	for child in %SpawnPoints.get_children():
		if child is Marker2D:
			newSpawn.append(child)

func spawnAsteroid(count : int):
	for value in range(count):
	#These spawn at random points along the %AsteroidSpawnPoint curve
		var newRock = preload("res://Entites/Enemies/Asteroid/asteroid.tscn").instantiate()
		%AsteroidSpawnPoint.progress_ratio = randf()
		newRock.global_position = %AsteroidSpawnPoint.global_position
		enemy_container.add_child(newRock)

func spawnSeeker(count :int):
	for value in range(count):
	#These spawn at random points along the %AsteroidSpawnPoint curve
		var newScout = preload("res://Entites/Enemies/SeekerPirate/seeker_pirate.tscn").instantiate()
		%AsteroidSpawnPoint.progress_ratio = randf()
		newScout.global_position = %AsteroidSpawnPoint.global_position
		enemy_container.add_child(newScout)
		
func spawnFighter():
	var newFighter = preload("res://Entites/Enemies/FighterHorizontal/fighterPirate.tscn").instantiate()
	newSpawn.pick_random().get_children()[0].add_child(newFighter)

func spawnPFP():
	## These spawn at a spawn point, but are attached to the SpawnPath inside of that point
	var newBomber = preload("res://Entites/Enemies/PathFollowPirate/pathFollowPirate.tscn").instantiate()
	newSpawn.pick_random().get_children()[0].add_child(newBomber)

func get_enemy_container() -> Node:
	return(enemy_container)
	
func get_bullet_container() -> Node:
	return(bullet_container)

func _on_intro_finished() -> void:
	if %timing.get_animation_list().has("preroll"):
		%timing.play("preroll")
	else:
		%timing.play("stage")
