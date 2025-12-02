extends State

func enter():
	get_tree().paused = true
	%PMUI.show()
	%"Scrolling Purple Space Background".process_mode = Node.PROCESS_MODE_DISABLED

func exit():
	%PMUI.hide()
	%"Scrolling Purple Space Background".process_mode = Node.PROCESS_MODE_ALWAYS

func update(_delta: float):
	if Input.is_action_just_pressed("ui_cancel"):
		Transitioned.emit(self, "stage")


func _on_button_pressed() -> void: #main menu button
	Transitioned.emit(self, "mainMenu")

func _on_button_2_pressed() -> void: #on resume pressed
	Transitioned.emit(self, "stage")