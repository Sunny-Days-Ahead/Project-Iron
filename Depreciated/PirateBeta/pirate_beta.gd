extends Node2D

@export var points : int = 1

@export_category("Speed")
@export var speed : float = 50.0
@export var maxSpeed : float = 400.0
@export var speedRamp : float = 225.0

var desiredDirection := Vector2(0, 0)
var desiredRotation : float

func _ready() -> void:
	pass #global_rotation_degrees = 180
	
func _process(delta: float) -> void:
	speed += speedRamp * delta
	if speed > maxSpeed:
		speed = maxSpeed
	
	desiredDirection = Global.player_node.global_position - global_position
	desiredDirection = desiredDirection.normalized()
	global_position += desiredDirection * speed * delta
	
	desiredRotation = desiredDirection.angle()  + deg_to_rad(90)
	global_rotation = desiredRotation 

func _on_health_component_died() -> void:
	var scoreNode : Label = Global.ui_node.find_child("Score")
	
	if scoreNode.has_method("addScore"):
		scoreNode.addScore(points)

	queue_free()
