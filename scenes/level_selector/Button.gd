extends Button

@onready var level = $".."

func _on_pressed():
	if level.isPlayable:
		$".."/Audio/Click.play()
	elif level.disabled == true:
		$".."/Audio/Error.play()
	SceneTransition.load_scene(level.battleScene)
	
func _on_mouse_entered():
	$"../Audio/Hover".play()
	if level.isBossBattle:
		level.boss.show()
		level.label.show()
	else:
		level.normal.show()
		level.label.show()
		
func _on_mouse_exited():
	if level.isBossBattle:
		level.boss.hide()
		level.label.hide()
	else:
		level.normal.hide()
		level.label.hide()
