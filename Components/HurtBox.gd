@icon("res://Assets/Icons/targeted.svg")
class_name HurtBox
extends Area2D

@export var health : HealthComponent

func _ready() -> void:
	area_entered.connect(_on_hit)
	
func _on_hit(area: Area2D) -> void:
	# Get returns null if the property doesn't exist
	var damage : int = area.get("damage")
	
	# If the area that hit us has a "damage" property, we use that to affect the health component
	if damage != null:
		# We can use negative "damage" to heal
		if damage < 0:
			health.heal(damage)
		else:
			health.damage(damage)
