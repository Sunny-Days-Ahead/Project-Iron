## Tracks how much health something has
@icon("res://Components/HealthComponent/heart.svg")
class_name HealthComponent
extends Node

@export var maxHealth : int

## Current HP
var currentHealth : int 

## Emitted when HP = 0
signal died #emtis when out of hp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fullHeal()

#sets health amount to max for full healing 
func fullHeal() -> void:
	setHealth(maxHealth)

#subtracts health 
func damage(amount :  int) -> void:
	currentHealth -= amount
	
	#you fuckin died lol
	if currentHealth <= 0:
		currentHealth = 0
		died.emit()

#restores health 
func heal(amount : int) -> void:
	currentHealth += amount
	
	#this caps the health so it cannot exceed max 
	if currentHealth > maxHealth:
		currentHealth = maxHealth

#current health becomes the amount 
func setHealth(amount) -> void:
	currentHealth = amount
	
	#caps overheals and kills you if you're at zero lol
	if currentHealth > maxHealth:
		currentHealth = maxHealth
	
	if currentHealth <= 0:
		died.emit()

#fuction to ask how much hp is left 
func getHealth() -> int:
	return(currentHealth)
