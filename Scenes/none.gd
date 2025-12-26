extends State


## To be implemented by the inheriting node. Called when the state is first entered.
func enter() -> void:
	%MainMenu.hide()
	%PauseMenu.hide()
	%GameOver.hide()
