extends Area2D

# This speed is moving LEFT (negative X)
@export var swim_speed = -150.0 

func _process(delta):
	# Move the fish to the left
	position.x += swim_speed * delta
	
	# Optional: Delete the fish once it's far off-screen to save memory
	if position.x < -500: # Adjust based on your screen width
		queue_free()

func _on_body_entered(body):
	# If the body entering the Area2D is the player, restart
	if body.name == "Player":
		#get_tree().reload_current_scene()
		print("Player hit a pufferfish!")
		die()
		
func die():
	# For now, we'll just restart the scene
	# You can add explosion effects or a Game Over menu here later
	get_tree().reload_current_scene() 

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Pufferfish died!")
	queue_free()
	
