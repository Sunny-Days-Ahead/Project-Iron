@icon("res://Components/HitBox/punch-blast.svg")
class_name HitBox
extends Area2D

@export var damage : int

signal hitTarget

func _ready() -> void:
	area_entered.connect(_on_hit)

#where to change the amount of damage a thing has done
func setDamage(value : int) -> void:
	damage = value
	
#damage multipler or divider
func getScaledDamage(factor : float) -> int:
	var result : int = (damage * factor) as int
	
	return(result)

#did i hit something? if its a hurtbox E M I T 
func _on_hit(area: Area2D) -> void:
	if area is HurtBox:
		hitTarget.emit()
