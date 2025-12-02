extends State

func _ready() -> void:
	Global.main_node = $"."
	Global.stage_node = %Stage
	Global.player_node = %Player
	Global.ui_node = %UI
	Global.bullet_container = %Bullets

func enter():
	get_tree().paused = true
	%Player.visible = false
	%Score.resetScore()
	%Score.hide()

	for child in Global.stage_node.get_children():
		child.queue_free()

	for child in Global.bullet_container.get_children():
		child.queue_free()

	%MMUI.show()
	%"Mission Briefing".grab_focus()

func exit():
	%MMUI.hide()

func _on_main_menu_start_game() -> void:
	%stage.newStage = 1
	Transitioned.emit(self, "stage")

func _on_main_menu_start_mission_brief() -> void:
	Transitioned.emit(self, "missionBrief")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_debug_pressed() -> void:
	%stage.newStage = 0
	Transitioned.emit(self, "stage")
