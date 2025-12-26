extends State


## To be implemented by the inheriting node. Called when the state is first entered.
func enter() -> void:
	%GameOver.show()

func exit() -> void:
	%GameOver.hide()