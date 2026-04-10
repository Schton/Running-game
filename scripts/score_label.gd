extends Label

func _process(_delta):
	# Every frame, update the text to match the Global score
	text = "Score: " + str(Global.score)
