extends Node
signal briefover

# Called when the node enters the scene tree for the first time.
func missionbrief() -> void:
	%CommandPortrait.show()
	%Commander1.start()
func _on_commander_1_finished() -> void:
	#To start the five second wait between speech bubbles
	%SpeechTime1.start()
func _on_speech_time_1_timeout() -> void:
	#clar the first speech label and start the next one
	%Commander1.queue_free()
	%Commander2.start()
func _on_commander_2_finished() -> void:
	#to start the second five second timer between bubbles
	%SpeechTime2.start()
func _on_speech_time_2_timeout() -> void:
	#clear the first and start the next one
	%Commander2.queue_free()
	%Commander3.start()

func _on_commander_3_finished() -> void:
	%SpeechTime3.start()
	
func _on_speech_time_3_timeout() -> void:
	%Commander3.queue_free()
	%Commander4.start()


func _on_commander_4_finished() -> void:
	%SpeechTime4.start()

func _on_speech_time_4_timeout() -> void:
	%Commander4.queue_free()
	%Commander5.start()
	
func _on_commander_5_finished() -> void:
	%SpeechTime5.start()


func _on_speech_time_5_timeout() -> void:
	%Commander5.queue_free()
	%CommandPortrait.hide()
	briefover.emit()
	


func _on_main_brief_start() -> void:
	missionbrief()
