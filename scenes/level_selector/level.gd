extends Control
class_name Level

var number: int = 0
var isCompleted: bool = false
@onready var battleScene: String = "res://scenes/battle_scene.tscn"

func _on_button_pressed():
	AudioPlayer.play_click()
	AudioPlayer.stop_music()
	get_tree().change_scene_to_file(battleScene)
