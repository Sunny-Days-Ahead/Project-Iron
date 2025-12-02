extends State


func enter():
	get_tree().paused = true

	# Pause the game and show the GameOver UI on player death
	for child in Global.bullet_container.get_children():
		queue_free()

	Global.player_node.hide()
	%GOUI.show()

func exit():
	get_tree().paused = false
	%GOUI.hide()

func _on_restart_pressed() -> void:
	Transitioned.emit(self, "stage")