class_name Game
extends Node

signal score_updated
signal stageChanged(newStage: Stage)

@export_category("Stage Config")
@export var firstStage : PackedScene

@export_category("Lives")
@export var startingLives : int = 3
@export var currentLives  : int

var score : int
var warcrimeAmount: int = 19582657
var currentStage: Stage

func _ready() -> void:
	currentLives = startingLives
	score = 0
	currentStage = get_tree().get_first_node_in_group("stages")

func _on_menu_game_quit() -> void:
	get_tree().quit()

func addScore(amount: int) -> void:
	score += amount
	score_updated.emit()
	
func commitWarcrime() -> void:
	score += warcrimeAmount
	score_updated.emit()

func getCurrentStage() -> Stage:
	return(currentStage)

func loadNextStage() -> void:
	if currentStage == null:
		currentStage = get_tree().get_first_node_in_group("stages")
		
	var next = currentStage.nextStage
	if next == null:
		next = firstStage
		
	changeStage(next)

func changeStage(nextStage: PackedScene) -> void:
	get_tree().get_first_node_in_group("stages").queue_free()
	var newStage = nextStage.instantiate()
	%SubViewport.add_child(newStage)
	currentStage = newStage
	stageChanged.emit(currentStage)

func _on_menus_game_start() -> void:
	loadNextStage()
	show_ui()

func show_ui() -> void:
	%GameUI.show()
	
func hide_ui() -> void:
	%GameUI.hide()
