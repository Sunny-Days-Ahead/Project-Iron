@icon("res://Assets/Icons/amplitude.svg")
class_name AudioJitterPlayer
extends AudioStreamPlayer

@export_range(0.0, 0.5, 0.01) var jitter : float = 0.0
@export var basePitchScale : float = 1.0

func _ready() -> void:
	finished.connect(_on_playback_finished)

func playJitter(from_position: float = 0.0) -> void:
	
	if jitter > 0.0:
		var pitchFactor = Global.rng.randf_range(-jitter, jitter)
		pitch_scale = basePitchScale * (1.0 + pitchFactor)
	else:
		pitch_scale = basePitchScale
	
	play(from_position)
	
func _on_playback_finished() -> void:
	pitch_scale = basePitchScale
