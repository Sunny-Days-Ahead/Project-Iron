extends State


## To be implemented by the inheriting node. Called when the state is first entered.
func enter() -> void:
	get_tree().paused = true
	%GameOver.show()

func exit() -> void:
	%GameOver.hide()
	get_tree().paused = false 
