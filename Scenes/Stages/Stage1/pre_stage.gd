extends Node

signal prerollFinished

func showSelf():
	%Ace.show()
	%SpeechBox.show()
	%dialouge.start()
	
func hideSelf():
	%Ace.hide()
	%SpeechBox.hide()
	


func _on_dialouge_finished() -> void:
	%wait.start()
	


func _on_wait_timeout() -> void:
	prerollFinished.emit()
	hideSelf()
