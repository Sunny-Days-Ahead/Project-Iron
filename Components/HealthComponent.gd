@icon("res://Assets/Icons/heart.svg")
class_name HealthComponent
extends Node

@export var maxHealth : int

var currentHealth : int
signal died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fullHeal()

func fullHeal() -> void:
	setHealth(maxHealth)

func damage(amount :  int) -> void:
	currentHealth -= amount
	
	if currentHealth <= 0:
		currentHealth = 0
		died.emit()

func heal(amount : int) -> void:
	currentHealth += amount
	
	if currentHealth > maxHealth:
		currentHealth = maxHealth

func setHealth(amount) -> void:
	currentHealth = amount
	
	if currentHealth > maxHealth:
		currentHealth = maxHealth
	
	if currentHealth <= 0:
		died.emit()

func getHealth() -> int:
	return(currentHealth)
