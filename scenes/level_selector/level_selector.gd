extends Control

@onready var levels: Array[Level] = [$Level1, $Level2, $Level3, $Level4, $Level5]
@onready var levelCount: int = levels.size()
@onready var completedLevels: Array[Level] = []

@export var lineWidth: int = 2

func _ready():
	setupLevels()

func setupLevels():
	for i in levelCount:
		levels[i].number = i + 1
		levels[i].label.text = "Level " + str(i + 1)
		levels[i].battleScene = "res://scenes/level_selector/battle.tscn"
		
		if i == 0:
			levels[i].isFirstLevel = true
			levels[i].isPlayable = true
		elif !levels[i].isCompleted:
			levels[i].button.disabled = true	
			levels[i].isPlayable = false
		
		if i < levelCount - 1:
			var line = Line2D.new()
			line.points = [levels[i].position, levels[i + 1].position]
			line.width = lineWidth
			line.z_index = -1
			add_child(line)
