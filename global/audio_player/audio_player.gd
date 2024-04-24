extends AudioStreamPlayer

var mute_music: bool = false
@onready var click_sound = preload("res://art/sfx/switch_007.ogg")

func play_music(stream: AudioStream, volume = 0.0):	
	if $music_player.stream == stream:
		return
		
	$music_player.stream = stream
	$music_player.volume_db = volume
	$music_player.play()
	
func stop_music():
	$music_player.stop()

func _on_music_player_finished():
	if not mute_music:
		$music_player.play()
	else:
		stop_music()

func play_click(volume = 0.0):	
	$click_player.play()

func change_mute():
	if mute_music:
		mute_music = false
		$music_player.play()
	else:
		mute_music = true
		$music_player.stop()
