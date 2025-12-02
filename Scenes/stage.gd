extends State

var currentStage : int = -9999
var newStage : int = 1

func enter():
	%Score.show()
	get_tree().paused = false

	# Reset the player
	%Player.visible = true

	if newStage == currentStage:
		return
	else:
		currentStage = newStage

	if currentStage < 1:
		change_stage("res://Scenes/Levels/DebugStage.tscn")
	else:
		change_stage("res://Scenes/Levels/Stage1/Stage1.tscn")

	%Player._ready()

func update(_delta: float):
	if Input.is_action_just_pressed("ui_cancel"):
		Transitioned.emit(self, "paused")

func change_stage(new_stage_path : String) -> void:
	# queue_free on all of the children inside of the Stage container
	for child in Global.stage_node.get_children():
		child.queue_free()

	# Load the scene, instantiate it, then add it to the stage container
	var loaded_scene = ResourceLoader.load(new_stage_path)
	var current_scene = loaded_scene.instantiate()
	Global.stage_node.add_child(current_scene)

func _on_player_player_death() -> void:
	Transitioned.emit(self, "gameover")