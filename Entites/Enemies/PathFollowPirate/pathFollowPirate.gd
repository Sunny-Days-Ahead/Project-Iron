extends PathFollow2D

@export var points : int = 1
@export var speed : float = 100.0

var main_node: Game

func _ready() -> void:
	%Spawner.spawnFunction = setup_bullet
	main_node = get_tree().get_first_node_in_group("Main") as Game

func _process(delta: float) -> void:
	progress += speed * delta

func _on_health_component_died() -> void:
	main_node.addScore(points)
	queue_free()

# This function sets the initial state of the bullet that the player fires with the spawner.
func setup_bullet(bulletNode : Node2D) -> void:
	bulletNode.is_player_bullet = false
	bulletNode.direction = Vector2.DOWN
	bulletNode.speed = 200.0
	bulletNode.damage = 1

func _on_spawner_spawned(_entity: Node) -> void:
	%BulletSFX.playJitter()
	
