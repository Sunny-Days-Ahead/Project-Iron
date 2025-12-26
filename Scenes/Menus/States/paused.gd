extends State

@export var menu_stage: PackedScene

## To be implemented by the inheriting node. Called when the state is first entered.
func enter() -> void:
	%PauseMenu.show()
	get_tree().paused = true

func exit() -> void:
	%PauseMenu.hide()
	get_tree().paused = false
	
func update(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		unpause()

func unpause() -> void:
	transition_to("none")

func _main_menu_pressed() -> void:
	var gameNode: Game = get_tree().get_first_node_in_group("Main")
	gameNode.changeStage(menu_stage)
	transition_to("mainmenu")
