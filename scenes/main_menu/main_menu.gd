extends Control

func _ready():
	pass
	
func _on_play_button_pressed():
	$Audio/NormalClick.play()
	get_tree().change_scene_to_file("res://scenes/level_selector/level_selector.tscn")
	
func _on_quit_button_pressed():
	$Audio/ExitClick.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
