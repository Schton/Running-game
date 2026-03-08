extends CharacterBody2D
# Define these at the top of your script or in the Inspector
@export var speed = 100.0

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
