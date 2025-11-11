@icon("res://Assets/Icons/chat-bubble.svg")
class_name SpeechLabel
extends Label

@export_multiline var dialogue : String
@export var typeSound : AudioStreamPlayer

# set and get are ways to customize what happens when someone writes to or fetches a property.
# When something changes the typeSpeed variable, it needs to get applied to our internal timer
# That's what the section below this declaration is doing.
@export var typeSpeed : float = 0.1:
	set(newSpeed):
		typeSpeed = newSpeed
		_timer.wait_time = newSpeed

signal finished				# Emits when the whole dialogue is finished
signal charPrinted			# Emits when one or more characters got typed

var _timer : Timer = Timer.new()
var _nextChar : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set up the internal timer for the typing effect
	_timer.autostart = false
	_timer.name = "TypeDelay"
	_timer.one_shot = false
	_timer.wait_time = typeSpeed
	_timer.timeout.connect(_on_character_timeout)
	add_child(_timer)
	
	# Clear any text in the label to start
	text = ""

func start() -> void:
	# In case the node is being re-used (we replace the dialogue and run it again after it finishes)
	text = ""
	_nextChar = 0
	
	if dialogue.length() > 0:
		# Length will be 0 on an empty string, and that would break the other scripts, so handle that here.
		_timer.start()
	else:
		# Running an empty dialogue means we instantly finish.
		finished.emit()

func printNextChar():
	if _nextChar < dialogue.length():
		# As long as there's characters left to print, print the next one and move the index forward.
		text = text + dialogue[_nextChar]
		_nextChar += 1
	else:
		# Otherwise, we're out of things to print!
		_timer.stop()
		finished.emit()
	
func skip() -> void:
	_timer.stop()
	
	for character in range(_nextChar, dialogue.length()):
		text = text + dialogue[character]	
	
	charPrinted.emit()
	finished.emit()

func _on_character_timeout():
	printNextChar()
	typeSound.play()
	charPrinted.emit()
