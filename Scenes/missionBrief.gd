extends Node
signal briefover

@export var speechList : Array[SpeechLabel]
var currentSpeech : int = 0

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if speechList[currentSpeech].isPlaying:
			%SpeechTimer.stop()
			_on_speech_timer_timeout()

func _on_speech_finished() -> void:
	%SpeechTimer.start()

func _on_main_brief_start() -> void:
	currentSpeech = 0
	%CommandPortrait.show()
	speechList[currentSpeech].start()

func _on_speech_timer_timeout() -> void:
	currentSpeech += 1
	
	speechList[currentSpeech - 1].queue_free()
	
	if currentSpeech >= speechList.size():
		%CommandPortrait.hide()
		briefover.emit()
	else:
		speechList[currentSpeech].start()
