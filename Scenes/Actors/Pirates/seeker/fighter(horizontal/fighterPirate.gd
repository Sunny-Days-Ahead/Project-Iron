extends "res://Scenes/Actors/Pirates/seeker/seekerPirate.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		%Spawner.spawnFunction = setup_bullet 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x += speed * delta 
	global_rotation_degrees = 90

# This function sets the initial state of the bullet that the player fires with the spawner.
func setup_bullet(bulletNode : Node2D) -> void:
	bulletNode.is_player_bullet = false
	bulletNode.direction = Vector2.DOWN
	bulletNode.speed = 200.0
	bulletNode.damage = 1
	
func _on_spawner_spawned(_entity: Node) -> void:
	%BulletSFX.playJitter()

func _on_spawner_timeout() -> void:
	%Spawner.spawn()
