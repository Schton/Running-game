extends Area2D

func _on_body_entered(body):
	# If the body entering the Area2D is the player, restart
	if body.name == "Player":
		#get_tree().reload_current_scene()
		print("Player hit a tako!")
		die()
		
func die():
	# For now, we'll just restart the scene
	# You can add explosion effects or a Game Over menu here later
	get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
