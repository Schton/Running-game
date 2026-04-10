extends Control

func _ready():
	# 1. Ensure the game is definitely NOT paused when menu starts
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = false
	
	# 2. Force the mouse to be visible so you can click buttons
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	# 3. Print to verify the menu is actually loading
	print("Main Menu Loaded")

func _on_play_button_pressed():
	Global.score = 0
	get_tree().change_scene_to_file("res://scenes/level1.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
