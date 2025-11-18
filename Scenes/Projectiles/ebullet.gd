extends Node2D
@export var anim :AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y += delta * 200
	anim.animation = "Shoot"
	anim.play()
	global_rotation_degrees = 180

# Timer to queue free after I fly off screen
func _on_timer_timeout() -> void:
	queue_free()

# Or if I hit a hurtbox, also queuefree
func _on_hit_box_hit_target() -> void:
	queue_free()
