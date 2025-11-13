extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.main_node = $"."
	Global.stage_node = %Stage
	Global.player_node = %Player
	Global.ui_node = %UI
	
	# Start by loading Stage 1  (we will probably remove this later to start with nothing and load the main menu ui instead
	change_stage("res://Scenes/Levels/Stage1.tscn")

func change_stage(new_stage_path : String) -> void:
	# queue_free on all of the children inside of the Stage container
	for child in Global.stage_node.get_children():
		child.queue_free()
	
	# Load the scene, instantiate it, then add it to the stage container
	var loaded_scene = ResourceLoader.load(new_stage_path)
	var current_scene = loaded_scene.instantiate()
	Global.stage_node.add_child(current_scene)

func set_ui(new_ui_path : String) -> void:
	# queue_free on all children inside of the UI container
	for child in Global.ui_node.get_children():
		child.queue_free()
		
	# Load the scene, instantiate it, then add it to the UI container
	var loaded_scene = ResourceLoader.load(new_ui_path)
	var current_scene = loaded_scene.instantiate()
	Global.ui_node.add_child(current_scene)
