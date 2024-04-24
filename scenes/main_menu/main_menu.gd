extends Control

@onready var menu_music = preload("res://art/music/bgunderwater.ogg")

func _ready():
	AudioPlayer.play_music(menu_music, 0.0)
	
func _on_play_button_pressed():
	$Click.play()
	AudioPlayer.stop_music()
	get_tree().change_scene_to_file("res://scenes/level_selector/level_selector.tscn")

func _on_quit_button_pressed():
	$Click.play()
	get_tree().quit()
