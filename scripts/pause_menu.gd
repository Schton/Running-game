extends Control

var game_paused = false

@onready var pause_menu = $"."

func _input(event):
	if event.is_action_pressed("pause"): 
		toggle_pause(!get_tree().paused)

func toggle_pause(game_paused):
	if game_paused:
		show()
		get_tree().paused = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		hide()
		get_tree().paused = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

func _on_continue_pressed():
	toggle_pause(false)

func _on_restart_pressed():
	get_tree().paused = false # Must unpause before reloading!
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
