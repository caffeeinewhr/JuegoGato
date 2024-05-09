extends AudioStreamPlayer

@onready var click_sound = preload("res://art/sfx/switch_007.ogg")
var isMusicEnabled: bool = true
var isVolumeUp: bool = true

func play_music(userStream: AudioStream, volume = 0.0):	
	if isMusicEnabled:
		$music_player.stream = userStream
		$music_player.volume_db = volume
		$music_player.play()
	
func stop_music():
	$music_player.stop()
	
func _on_music_player_finished():
	$music_player.play()

func play_click(volume = -10.0):	
	$click_player.volume_db = volume
	$click_player.play()

func change_mute():
	if isVolumeUp:
		$music_player.volume_db = -100
	else:
		$music_player.volume_db = 0.0
		
	isVolumeUp = not isVolumeUp
		
func change_play():
	if isMusicEnabled:
		$music_player.play()
	else:
		$music_player.stop()
		
	isMusicEnabled = not isMusicEnabled
