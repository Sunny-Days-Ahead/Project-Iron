extends Node

signal startGame
signal startMissionBrief

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%"Begin Mission".grab_focus()

func _on_begin_mission_pressed() -> void:
	startGame.emit()

func _on_mission_briefing_pressed() -> void:
	startMissionBrief.emit()

func _on_exit_pressed() -> void:
	get_tree().quit()
