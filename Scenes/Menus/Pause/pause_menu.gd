extends Control

signal Unpause
signal MainMenu
signal ExitGame

func _unpause()  -> void:
	Unpause.emit()

func _MainMenu() -> void:
	MainMenu.emit()

func _ExitGame() -> void:
	ExitGame.emit()
