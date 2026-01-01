extends State


## To be implemented by the inheriting node. Called when the state is first entered.
func enter() -> void:
	%MainMenu.hide()
	%PauseMenu.hide()
	%GameOver.hide()
	

func update(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		print("pressed")
		%StateMachine.current_state.transition_to("paused")


func _on_player_player_death() -> void:
	transition_to("GameOver")
