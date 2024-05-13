extends Control

var paused: bool = false

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
			
func pauseMenu():
	paused = !paused
	if paused:
		print("pauso")
		$".".show()
		AudioSettings.volume = -5.0
		print(AudioSettings.volume)
		get_tree().paused = true
	else:
		print("quito pausa")
		$".".hide()
		AudioSettings.volume = 0.0
		print(AudioSettings.volume)
		get_tree().paused = false

func _on_music_button_pressed():
	print("musica pulsado")
	$Audio/NormalClick.play()
	print(AudioSettings.isVolumeUp)
	if AudioSettings.isVolumeUp:
		print("Music: ON")
		$VBoxContainer/MusicButton.set_text("Music: ON") 
		AudioSettings.isVolumeUp = false
	else:
		print("Music: OFF")
		$VBoxContainer/MusicButton.set_text("Music: OFF") 
		AudioSettings.isVolumeUp = true
	
func _on_resume_button_pressed():
	print("resume pulsado")
	$Audio/ExitClick.play()
	pauseMenu()

func _on_quit_button_pressed():
	print("quit pulsado")
	$Audio/ExitClick.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
	
