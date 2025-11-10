@icon("res://Assets/Icons/targeted.svg")
class_name HurtBox
extends Area2D

@export var health : HealthComponent

func _ready() -> void:
	area_entered.connect(_on_hit)
	
func _on_hit(area: Area2D) -> void:
	if area is HitBox:
		# We can use negative "damage" to heal
		if area.damage < 0:
			health.heal(area.damage)
		else:
			health.damage(area.damage)
