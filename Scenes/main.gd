extends Node
signal briefStart


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%CommandPortrait.visible = false
	Global.main_node = $"."
	Global.stage_node = %Stage
	Global.player_node = %Player
	Global.ui_node = %UI

func change_stage(new_stage_path : String) -> void:
	# queue_free on all of the children inside of the Stage container
	for child in Global.stage_node.get_children():
		child.queue_free()
	
	# Load the scene, instantiate it, then add it to the stage container
	var loaded_scene = ResourceLoader.load(new_stage_path)
	var current_scene = loaded_scene.instantiate()
	Global.stage_node.add_child(current_scene)

func _on_main_menu_start_game() -> void:
	%"Main Menu"/MMUI.hide()
	change_stage("res://Scenes/Levels/Stage1.tscn")
	$UI/Score.visible = true
	%Player.visible = true

func _on_main_menu_start_mission_brief() -> void:
	%"Main Menu"/MMUI.hide()
	%CommandPortrait.show()
	briefStart.emit()
	%"Mission Briefing".hide()


func _on_timer_timeout() -> void:
	
	change_stage("res://Scenes/main_menu.tscn")


func _on_mission_brief_briefover() -> void:
	%"Main Menu"/MMUI.show()
