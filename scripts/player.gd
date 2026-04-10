extends CharacterBody2D
# Define these at the top of your script or in the Inspector
@export var speed = 100.0
@onready var sfx_death = $SFXDeath

func _physics_process(delta):
	# 1. Constant Forward Motion
	velocity.x = speed

	# 2. Up/Down Movement (Only while holding)
	if Input.is_action_pressed("up"):
		velocity.y = -speed  # Move Up
	elif Input.is_action_pressed("down"):
		velocity.y = speed   # Move Down
	else:
		velocity.y = 0       # Stop moving vertically when nothing is held

	# 3. Apply movement
	move_and_slide()
	
func die():
	# 3. Play the sound
	sfx_death.play()
	
	# Stop the player from moving further
	set_physics_process(false) 
	
	# 4. Wait for the sound to finish before changing scenes
	# Otherwise, the sound will cut off instantly!
	await sfx_death.finished
	
	# Save level path and go to death screen (as we discussed before)
	Global.current_level_path = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
