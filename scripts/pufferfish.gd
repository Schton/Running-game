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
	# We check if the thing we hit has a function called "die"
	if body.has_method("die"):
		print("Pufferfish hit the player!")
		body.die() # This tells the PLAYER script to run its die function

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Pufferfish died!")
	queue_free()
	
