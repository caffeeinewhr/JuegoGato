extends Control

@onready var menu_music = preload("res://art/music/demo_menu.wav")
@onready var menu_bg_sound = preload("res://art/music/bgunderwater.ogg")

func _ready():
	AudioPlayer.play_music(menu_bg_sound, 0.0)
	AudioPlayer.play_music(menu_music, -20.0)
	
func _on_play_button_pressed():
	AudioPlayer.play_click()
	AudioPlayer.stop_music()
	get_tree().change_scene_to_file("res://scenes/level_selector/level_selector.tscn")

func _on_quit_button_pressed():
	AudioPlayer.play_click()
	get_tree().quit()

func _on_music_button_pressed():
	AudioPlayer.play_click()
	AudioPlayer.change_mute()
	if AudioPlayer.mute_music:
		$VBoxContainer2/MusicButton.set_text("Music: OFF") 
	else:
		$VBoxContainer2/MusicButton.set_text("Music: ON") 
