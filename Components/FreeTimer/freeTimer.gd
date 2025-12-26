@icon("res://Components/FreeTimer/duration.svg")
class_name FreeTimer
extends Timer

func _ready() -> void:
	timeout.connect(clearParent)
	
func clearParent():
	get_parent().queue_free()
