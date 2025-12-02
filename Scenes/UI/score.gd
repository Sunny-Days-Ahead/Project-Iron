extends Label
var score : int

func _ready() -> void:
	score = 0
	updateScoreText()

func resetScore() -> void:
	score = 0
	updateScoreText()

func addScore(points : int):
	score += points
	updateScoreText()

func commitWarcrime():
	score += 19582657
	updateScoreText()

func updateScoreText() -> void:
	%UI/Score.text = "Score: " + str(score)