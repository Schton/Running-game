extends Area2D

@export var speed = 150.0
@export var detection_range = 400.0 # How close the player needs to be (in pixels)

var player = null
var has_passed_player = false
var is_chasing = false

func _ready():
	player = get_tree().root.find_child("Player", true, false)

func _process(delta):
	if player == null:
		return

	# 1. Calculate distance to player
	var distance_to_player = global_position.distance_to(player.global_position)
	
	# 2. Check if player has passed (X-axis)
	if player.global_position.x > global_position.x:
		has_passed_player = true

	# 3. Trigger chase if within range AND hasn't been passed yet
	if not has_passed_player and distance_to_player <= detection_range:
		is_chasing = true

	# 4. Movement Logic
	var velocity = Vector2.ZERO
	
	if is_chasing and not has_passed_player:
		# CHASE MODE: Tracking player Y
		var direction_to_player = (player.global_position - global_position).normalized()
		velocity.y = direction_to_player.y * speed
		velocity.x = -speed 
	else:
		# NORMAL/ESCAPE MODE: Just fly straight left
		velocity.y = 0 
		velocity.x = -speed 

	position += velocity * delta
	
	# Optional: Delete the fish once it's far off-screen to save memory
	if position.x < -500: # Adjust based on your screen width
		queue_free()

func _on_body_entered(body):
	# If the body entering the Area2D is the player, restart
	if body.name == "Player":
		#get_tree().reload_current_scene()
		print("Player hit a tako!")
		die()
		
func die():
	# For now, we'll just restart the scene
	# You can add explosion effects or a Game Over menu here later
	get_tree().reload_current_scene() 

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Tako died!")
	queue_free()
	
