extends CanvasLayer

func _ready():
	# Force the mouse to be visible and usable
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_play_button_pressed():
	# Replace "res://scenes/level1.tscn" with the actual path to your level 1 scene
	get_tree().change_scene_to_file("res://scenes/level1.tscn")

func _on_quit_button_pressed():
	# This closes the game
	get_tree().quit()
