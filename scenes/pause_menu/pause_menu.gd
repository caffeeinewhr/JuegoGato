extends Control

var paused: bool = false

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
			
func pauseMenu():
	paused = !paused
	if paused:
		$".".show()
		Engine.time_scale = 0
	else:
		$".".hide()
		Engine.time_scale = 1

func _on_music_pressed():
	AudioPlayer.play_click()
	AudioPlayer.change_mute()
	if AudioPlayer.isVolumeUp:
		$"."/MarginContainer/VBoxContainer/Music.set_text("Music: ON") 
	else:
		$"."/MarginContainer/VBoxContainer/Music.set_text("Music: OFF") 

func _on_quit_pressed():
	AudioPlayer.play_click()
	get_tree().quit()
