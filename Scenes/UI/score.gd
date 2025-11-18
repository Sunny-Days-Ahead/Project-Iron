extends Label
var score : int

func _ready() -> void:
	score = 0
	%UI/Score.text = "Score: " + str(score)
	
func addScore(points : int):
	score += points
	%UI/Score.text = "Score: " + str(score)
	
func commitWarcrime():
	score += 19582657
	%UI/Score.text = "Score: " + str(score)
