extends AudioStreamPlayer

func play_music(stream: AudioStream, volume = 0.0):	
	if $music_player.stream == stream:
		return
		
	$music_player.stream = stream
	$music_player.volume_db = volume
	$music_player.play()
	
func stop_music():
	$music_player.stop()

func _on_music_player_finished():
	$music_player.play()
