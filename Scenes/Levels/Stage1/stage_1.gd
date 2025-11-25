extends Node2D

# List of Enemy Spawn points
var newSpawn : Array[Marker2D]

func _ready() -> void:
	print("Stage 1: Ready")
	
	# Populate the list of Enemy Spawn points
	for child in %AlphaSpawnPoints.get_children():
		if child is Marker2D:
			newSpawn.append(child)
	
func spawnAlpha():
	# These spawn randomly at a spawn point and not much else is needed
	var newFighter = preload("res://Depreciated/PirateAlpha/pirate_alpha.tscn").instantiate()
	newSpawn.pick_random().add_child(newFighter)

func spawnBeta(count : int):
	for value in range(count):
		# These spawn at random points along the PirateSpawnPoint Curve
		var newPirate = preload("res://Depreciated/PirateBeta/pirate_beta.tscn").instantiate()
		%PirateSpawnPoint.progress_ratio = randf()
		newPirate.global_position = %PirateSpawnPoint.global_position
		add_child(newPirate)

func spawnCharlie():
	# These spawn at a spawn point, but are attached to the SpawnPath inside of that point
	var newBomber = preload("res://Depreciated/PirateCharlie/pirate_charlie.tscn").instantiate()
	newSpawn.pick_random().get_children()[0].add_child(newBomber)6
