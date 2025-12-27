extends Control

signal intro_finished

var mainNode : Game 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mainNode = get_tree().get_first_node_in_group("Main")
	%Score.text = "Score " + str(mainNode.score)


func _on_main_score_updated() -> void:
	%Score.text = "Score " + str(mainNode.score)


func _on_main_stage_changed(newStage: Stage) -> void:
	%stageX.text = str(newStage.stageTitle)
	%animator.play("FlyBy")


func _on_animator_finished(_anim_name: StringName) -> void:
	intro_finished.emit()


func showSelf():
	%StageStartUI.show()
	
func hideSelf():
	%StageStartUI.hide()
