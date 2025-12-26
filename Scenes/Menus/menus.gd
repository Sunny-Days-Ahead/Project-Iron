extends Control

signal gameStart
signal gameQuit

func _onExitGame() -> void:
	gameQuit.emit()

func startGame() -> void:
	gameStart.emit()
