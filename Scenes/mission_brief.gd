extends State

@export var speechList : Array[SpeechLabel]
var currentSpeech : int = 0

func enter():
	# Show Command Portrait
	%CommandPortrait.show()

	# Hide the Mission Briefing menu item permanently
	#%"Mission Briefing".hide()

	currentSpeech = 0
	speechList[currentSpeech].show()
	speechList[currentSpeech].start()


func update(_delta: float) -> void:
	if currentSpeech >= speechList.size():
		print(currentSpeech)
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


func _on_mission_brief_briefover() -> void:
	# Return to main menu after brief over
	Transitioned.emit(self, "mainMenu")


func _on_speech_finished() -> void:
	# Start the timer after each message complete to linger on screen
	%SpeechTimer.start()


func _on_speech_timer_timeout() -> void:
	# When the linger timer is finished, move on to the next one
	speechList[currentSpeech].hide()
	currentSpeech += 1

	# If that's the end of the list, hide portrait and change state
	if currentSpeech >= speechList.size():
		Transitioned.emit(self, "mainMenu")

	# Otherwise, play it
	else:
		speechList[currentSpeech].show()
		speechList[currentSpeech].start()

func exit():
	%CommandPortrait.hide()
