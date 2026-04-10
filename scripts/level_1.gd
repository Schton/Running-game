extends Node2D

@onready var bgm_player = $BGMPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.current_level_path = scene_file_path
	bgm_player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func set_music_paused(is_paused: bool):
	bgm_player.stream_paused = is_paused
