extends Node2D
@export var anim :AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y += delta * 200
	anim.animation = "Shoot"
	anim.play()
	global_rotation_degrees = 180


func _on_timer_timeout() -> void:
	queue_free()


func _on_hit_box_hit_target() -> void:
	queue_free()
