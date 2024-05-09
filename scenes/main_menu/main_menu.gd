extends Control

@onready var music = preload("res://art/music/demo_menu.wav")

func _ready():
	AudioPlayer.play_music(music, -10.0)
	
func _on_play_pressed():
	AudioPlayer.play_click()
	AudioPlayer.stop_music()
	get_tree().change_scene_to_file("res://scenes/level_selector/level_selector.tscn")

func _on_quit_pressed():
	AudioPlayer.play_click()
	get_tree().quit()
