extends Control

signal gameStart
signal gameQuit
signal stageRestart
signal debug

func _onExitGame() -> void:
	gameQuit.emit()

func startGame() -> void:
	gameStart.emit()


func _on_main_player_died() -> void:
	%StateMachine.change_state("gameover")


func _on_game_over_restart_stage() -> void:
	stageRestart.emit()
	%StateMachine.change_state("none")


func _on_main_menu_start_debug() -> void:
	debug.emit()
	%StateMachine.change_state("none")
