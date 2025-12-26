extends Control

signal RestartStage
signal ExitGame

func _RestartStage() -> void:
	RestartStage.emit()

func _ExitGame() -> void:
	ExitGame.emit()