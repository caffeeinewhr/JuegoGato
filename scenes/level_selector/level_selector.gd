extends Control

#@onready var LevelScene = preload("res://scenes/level_selector/level.tscn")
signal number_changed

@export var levelCount: int = 5
@export var levels: Array[Level] = []
@export var completedLevels: Array[Level] = []

@export var lineWidth: int = 2

#@export var minX: int = 20
#@export var maxX: int = size.x - 20
#@export var minY: int = 20
#@export var maxY: int = size.y - 20 

func _ready():
	levels = [$Level1, $Level2, $Level3, $Level4, $Level5]
	setupLevels()

func setupLevels():
	# Falta emitir una señal para cambiar el label al cambiar el numero desde aqui
	for i in levelCount:
		levels[i].number = i + 1
		levels[i].label.text = "Level " + str(i + 1)
		
		if i == 0:
			levels[i].isFirstLevel = true
		elif !levels[i].isCompleted:
			levels[i].button.disabled = true	
		
		if i < levelCount - 1:
			var line = Line2D.new()
			line.points = [levels[i].position, levels[i + 1].position]
			line.width = lineWidth
			line.z_index = -1
			add_child(line)

#func placeLevels():
	#var lastPosition = Vector2(minX, randf_range(minY, maxY))
	#
	#for i in range(levelCount):
		#var level = LevelScene.instantiate() 
		#level.number = i + 1
		#level.position = lastPosition
		#levels.append(level)
		#add_child(level)
		#lastPosition.x += 50
		#lastPosition.x = clamp(lastPosition.x, minX, maxX)
		#lastPosition.y = randf_range(minY, maxY)
