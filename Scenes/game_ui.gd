class_name GameUI
extends Control

signal intro_finished
signal outro_finished
signal dialogue_finished

var mainNode : Game 
var lastStageTitle: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mainNode = get_tree().get_first_node_in_group("Main")
	%Score.text = "Score " + str(mainNode.score)

func showSelf():
	%StageStartUI.show()
	
func hideSelf():
	%StageStartUI.hide()

func play_intro() -> void:
	%stageX.text = lastStageTitle
	%FlyByAnimator.play("IntroFlyBy")

func play_outro() -> void:
	%stageX.text = lastStageTitle + " Complete"
	%FlyByAnimator.play("OutroFlyBy")

func play_dialogue(dialogue: String):
	print("Playing Dialogue!")
	%DialogueLabel.dialogue = dialogue
	%StageDialogue.show()
	%DialogueLabel.start()
	await %DialogueLabel.finished
	%HideDelay.start()
	await %HideDelay.timeout
	%StageDialogue.hide()
	dialogue_finished.emit()

func _on_main_score_updated() -> void:
	%Score.text = "Score " + str(mainNode.score)

func _on_main_stage_changed(newStage: Stage) -> void:
	lastStageTitle = newStage.stageTitle
	play_intro()

func _on_animator_finished(anim_name: StringName) -> void:
	if anim_name == "IntroFlyBy":
		intro_finished.emit()
		return
		
	if anim_name == "OutroFlyBy":
		outro_finished.emit()
		return
