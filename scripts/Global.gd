extends Node

var score: int = 0
var current_level_path: String = ""
const SPAWN_SFX = preload("res://assets/audio/re-zero-return-by-death.mp3")

func _ready():
	# Timer for score
	var timer = Timer.new()
	timer.wait_time = 0.1
	timer.autostart = true
	timer.timeout.connect(_on_score_timer_timeout)
	add_child(timer)

func _on_score_timer_timeout():
	score += 1
	
func play_spawn_sound():
	var sfx_player = AudioStreamPlayer.new()
	add_child(sfx_player)
	sfx_player.stream = SPAWN_SFX
	sfx_player.play()
	sfx_player.finished.connect(sfx_player.queue_free)
