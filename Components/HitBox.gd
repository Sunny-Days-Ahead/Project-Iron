@icon("res://Assets/Icons/punch-blast.svg")
class_name HitBox
extends Area2D

@export var damage : int

func setDamage(value : int) -> void:
	damage = value
	
func getScaledDamage(factor : float) -> int:
	var result : int = (damage * factor) as int
	
	return(result)
