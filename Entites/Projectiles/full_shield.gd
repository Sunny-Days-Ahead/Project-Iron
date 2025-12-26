extends "res://Entites/Projectiles/bullet.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_box = %HitBox
	anim = %Animation
	is_player_bullet = false
	hit_box.damage = damage
	global_rotation = 0.0
	self.get_parent().remove_child(self)
	#Global.bullet_container.add_child(self)
