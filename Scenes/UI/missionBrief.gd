extends Node

# Emitted when Brief complete
signal briefover

@export var speechList : Array[SpeechLabel]
var currentSpeech : int = 0

func _process(_delta: float) -> void:
	if currentSpeech >= speechList.size():
		return
		
	# If you press a button while a speech label is playing, stop it and move to the next
	if Input.is_action_just_pressed("ui_accept"):
		# If a message is playing, jump to the end
		if speechList[currentSpeech].isPlaying:
			speechList[currentSpeech].skip()
			
		# If we're in the post-message delay, skip it. (Comment this to disable)
		elif not %SpeechTimer.is_stopped():
			%SpeechTimer.stop()
			_on_speech_timer_timeout()

func _on_speech_finished() -> void:
	# Start the timer after each message complete to linger on screen
	%SpeechTimer.start()

func _on_main_brief_start() -> void:
	# Start at speech index 0, show portrait, play message
	currentSpeech = 0
	%CommandPortrait.show()
	speechList[currentSpeech].start()

func _on_speech_timer_timeout() -> void:
	# When the linger timer is finished, move on to the next one
	currentSpeech += 1
	speechList[currentSpeech - 1].queue_free()
	
	# If that's the end of the list, hide portrait and emit briefover
	if currentSpeech >= speechList.size():
		%CommandPortrait.hide()
		briefover.emit()
	
	# Otherwise, play it
	else:
		speechList[currentSpeech].start()
