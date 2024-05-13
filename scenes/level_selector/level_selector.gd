extends Control

@onready var LevelScene = preload("res://scenes/level_selector/level.tscn")

@export var levels: Array[Level] = []
@export var levelCount: int = 5
@export var completedLevels: Array[Level] = []

@export var minX: int = 20
@export var maxX: int = size.x - 20
@export var minY: int = 20
@export var maxY: int = size.y - 20 

@export var lineWidth: int = 2

func _ready():
	placeLevels()
	connectLevels()
	
func placeLevels():
	var lastPosition = Vector2(minX, randf_range(minY, maxY))
	
	for i in range(levelCount):
		var level = LevelScene.instantiate() 
		level.number = i + 1
		level.position = lastPosition
		levels.append(level)
		add_child(level)
		lastPosition.x += 50
		lastPosition.x = clamp(lastPosition.x, minX, maxX)
		lastPosition.y = randf_range(minY, maxY)
		
func connectLevels():
	for i in range(levels.size() - 1):			
		var line = Line2D.new()
		line.points = [levels[i].position, levels[i + 1].position]
		line.width = lineWidth
		line.z_index = -1
		add_child(line)
