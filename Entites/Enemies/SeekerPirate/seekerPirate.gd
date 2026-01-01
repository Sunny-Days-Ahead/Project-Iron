extends Node2D

@export var points : int = 1

@export_category("Speed")
@export var speed : float = 50.0
@export var maxSpeed : float = 400.0
@export var speedRamp : float = 225.0
@export var dropChance = 0.25

var mainNode: Game
var playerNode : Player
var desiredDirection := Vector2(0, 0)
var desiredRotation : float


func _ready() -> void:
	playerNode = get_tree().get_first_node_in_group("Player")
	mainNode = get_tree().get_first_node_in_group("Main")
	$Sprite2D.hide()
	$self.animation = "default"
	
func _process(delta: float) -> void:
	pass
	speed += speedRamp * delta
	if speed > maxSpeed:
		speed = maxSpeed
	
	desiredDirection = playerNode.global_position - global_position
	desiredDirection = desiredDirection.normalized()
	global_position += desiredDirection * speed * delta
	
	desiredRotation = desiredDirection.angle()  + deg_to_rad(90)
	global_rotation = desiredRotation 

func _on_health_component_died() -> void:
	mainNode.addScore(points)
	$self.play("died")
	if randf() <= dropChance:
		$pickupSpawn.spawn()
	


func _on_ship_animation_finished() -> void:
	print("ship died")
	queue_free()
