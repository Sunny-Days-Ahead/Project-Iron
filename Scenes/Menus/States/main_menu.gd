extends State

@export var menuContainer: Control

## To be implemented by the inheriting node. Called when the state is first entered.
func enter() -> void:
	var gameNode: Game = get_tree().get_first_node_in_group("Main")
	gameNode.hide_ui()
	
	%MainMenu.show()
	get_tree().paused = true

func exit() -> void:
	%MainMenu.hide()
	get_tree().paused = false


func _on_main_menu_start_game() -> void:
	transition_to("none")
	menuContainer.startGame()
