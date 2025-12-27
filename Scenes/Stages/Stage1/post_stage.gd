extends Node
signal postrollFinished

func showSelf():
	%Ace2.show()
	%SpeechBox2.show()
	%endDialouge.start()
	
func hideSelf():
	%Ace2.hide()
	%SpeechBox2.hide()
	

func _on_endDialouge_finished() -> void:
	%endWait.start()

func _on_end_wait_timeout() -> void:
	postrollFinished.emit()
	hideSelf()
