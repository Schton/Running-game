extends Area2D

# Export these so you can change them per level in the Inspector
@export_file("*.tscn") var next_scene_path: String
@export var level_name: String = "Level 2"

func _on_body_entered(body):
	# Check if the object hitting the line is the Player
	if body.name == "Player":
		# Prevent multiple triggers
		set_deferred("monitoring", false)
		
		# Call your global transition script
		if Transition:
			Transition.change_level(next_scene_path, level_name)
