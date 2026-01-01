extends "res://Entites/Enemies/SeekerPirate/seekerPirate.gd"
var angle
	
func _ready() -> void:
	
	angle = randf_range(-45, 45)
	
func _process(delta: float) -> void:
	global_position.y += speed * delta
	global_rotation_degrees += angle * delta

func _on_health_component_died() -> void:
	$HurtBox.queue_free()
	$HitBox.queue_free()
	$self.hide()
	%Explodes.play()
	
	if randf() <= dropChance:
		$pickupSpawn.spawn()

func _on_explodes_animation_finished() -> void:
	queue_free()
