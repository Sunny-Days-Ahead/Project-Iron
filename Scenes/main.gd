extends Node

# Signal to start Mission Brief
signal briefStart

func _ready() -> void:
	# Game starts paused in the main menu
	get_tree().paused = true
	
	# Initialize Globals
	Global.main_node = $"."
	Global.stage_node = %Stage
	Global.player_node = %Player
	Global.ui_node = %UI
	Global.bullet_container = %Bullets

func change_stage(new_stage_path : String) -> void:
	# queue_free on all of the children inside of the Stage container
	for child in Global.stage_node.get_children():
		child.queue_free()
	
	# Load the scene, instantiate it, then add it to the stage container
	var loaded_scene = ResourceLoader.load(new_stage_path)
	var current_scene = loaded_scene.instantiate()
	Global.stage_node.add_child(current_scene)
	
	# Reset the player
	%Player.visible = true
	%Player._ready()
	
	# Start the game after stage load
	get_tree().paused = false

func _on_main_menu_start_game() -> void:
	# Triggered on Main Menu -> Begin Mission
	%"Main Menu"/MMUI.hide()
	
	# Set Stage 1
	change_stage("res://Scenes/Levels/Stage1/Stage1.tscn")
	Global.stage_node.currentStage = 1
	
	# Show Score
	$UI/Score.visible = true

func _on_main_menu_start_mission_brief() -> void:
	# Triggered on Mission Brief
	%"Main Menu"/MMUI.hide()
	
	# Show Command Portrait
	%CommandPortrait.show()
	
	# Emit signal to the mission brief scene to play
	briefStart.emit()
	
	# Hide the Mission Briefing menu item permanently
	%"Mission Briefing".hide()

func _on_mission_brief_briefover() -> void:
	# Return to main menu after brief over
	%"Main Menu"/MMUI.show()

func _on_player_player_death() -> void:
	# Pause the game and show the GameOver UI on player death
	get_tree().paused = true 
	%GOUI.show()
	
func _on_restart_pressed() -> void:
	# Reset button on Game Over
	match %Stage.currentStage:
		0:
			change_stage("res://Scenes/Levels/DebugStage.tscn")
			%GOUI.hide()
			get_tree().paused = false
		1:
			change_stage("res://Scenes/Levels/Stage1/Stage1.tscn")
			%GOUI.hide()
			get_tree().paused = false


func _on_button_pressed() -> void:
	%"Main Menu"/MMUI.hide()
	change_stage("res://Scenes/Levels/DebugStage.tscn")
	Global.stage_node.currentStage = 0
