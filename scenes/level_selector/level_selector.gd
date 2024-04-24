extends Control

@onready var level_selector_music = preload("res://art/music/mapa.wav")

func _ready():
	AudioPlayer.play_music(level_selector_music, 0.0)
	# Esto se encarga de obtener todos los nodos de cada nivel y establecer
	# el numero de nivel correspondiente al cargar la escena
	var level_controls = get_tree().get_nodes_in_group("level_controls")
	print_tree()
	for i in range(level_controls.size()):
		var label = level_controls[i].get_node("Label")
		label.text = "Level " + str(i + 1)
