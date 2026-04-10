extends Control

func _ready():
	# Ensure the mouse is visible so the player can click
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = false
	
	# If your game pauses when the player dies, 
	# this ensures the menu stays active.
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_restart_pressed():
	print("Restarting level: ", Global.current_level_path)
	
	Global.play_spawn_sound()
	# 1. Unpause the game
	get_tree().paused = false
	Global.score = 0
	
	# 2. Check if we actually have a saved path
	if Global.current_level_path != "":
		get_tree().change_scene_to_file(Global.current_level_path)
	else:
		 #Fallback just in case something went wrong
		get_tree().change_scene_to_file("res://scenes/level1.tscn")

func _on_quit_pressed():
	# Cleanly exit the game
	get_tree().quit()
