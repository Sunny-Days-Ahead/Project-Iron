extends Node2D

@export var is_player_bullet: bool = true
@export var direction : Vector2 = Vector2.UP
@export var speed : float = 200.0
@export var damage : int = 1

var hit_box : HitBox
var anim : AnimatedSprite2D

func _ready() -> void:
	hit_box = %HitBox
	anim = %Animation

	if is_player_bullet:
		hit_box.set_collision_layer_value(2, true)		# Player Bullet Layer
		hit_box.set_collision_layer_value(4, false)		# Enemy Bullet Layer
		
		hit_box.set_collision_mask_value(1, false)		# Player Layer
		hit_box.set_collision_mask_value(3, true)		# Enemy Layer
	else:
		hit_box.set_collision_layer_value(2, false)		# Player Bullet Layer
		hit_box.set_collision_layer_value(4, true)		# Enemy Bullet Layer
		
		hit_box.set_collision_mask_value(1, true)		# Player Layer
		hit_box.set_collision_mask_value(3, false)		# Enemy Layer

	hit_box.damage = damage

	global_rotation = direction.angle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += direction * speed * delta

# Timer to queue free after I fly off screen
func _on_timer_timeout() -> void:
	queue_free()

# Or if I hit a hurtbox, also queuefree
func _on_hit_box_hit_target() -> void:
	queue_free()
