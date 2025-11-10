extends Node2D

func spawnMob():
	var newPirate = preload("res://Scenes/Actors/pirate_beta.tscn").instantiate()
	%PirateSpawnPoint.progress_ratio = randf()
	newPirate.global_position = %PirateSpawnPoint.global_position
	add_child(newPirate)
	
func _on_pirate_spawn_1_timeout() -> void:
	spawnMob()
