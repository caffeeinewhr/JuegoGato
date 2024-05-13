extends Control
class_name Level

@onready var normal: Control = $Normal
@onready var boss: Control = $Boss

@onready var label: Label = $Label
@onready var button: Button = $Button

@onready var battleScene: String = "res://scenes/battle_scene.tscn"

@export var number: int = 0
@export var isCompleted: bool = false
@export var isFirstLevel: bool = false
@export var isBossBattle: bool = false

func _ready():
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file(battleScene)

func changeNumber(newNumber):
	number = newNumber

func _on_button_mouse_entered():
	if isBossBattle:
		boss.show()
		label.show()
	else:
		normal.show()
		label.show()
		
func _on_button_mouse_exited():
	if isBossBattle:
		boss.hide()
		label.hide()
	else:
		normal.hide()
		label.hide()
