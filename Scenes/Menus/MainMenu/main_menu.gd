extends Control

signal startBriefing
signal startGame
signal exitGame
signal startDebug

func _startBrief() -> void:
	startBriefing.emit()

func _startGame() -> void:
	startGame.emit()

func _exitGame() -> void:
	exitGame.emit()

func _startDebug() -> void:
	startDebug.emit()
