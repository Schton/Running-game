extends CanvasLayer

@onready var anim = $AnimationPlayer
@onready var label = $Label

func change_level(target_scene_path: String, level_name: String):
	label.text = level_name
	
	# Fade to white
	anim.play("fade_to_white")
	await anim.animation_finished
	
	# Switch scenes while screen is white
	get_tree().change_scene_to_file(target_scene_path)
	
	# Fade back to gameplay
	anim.play_backwards("fade_to_white")
