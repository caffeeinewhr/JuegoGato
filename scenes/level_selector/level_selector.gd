extends Control

var levelCount: int = 5
var levels: Array[Level] = []
var completedLevels: Array[Level] = []
@onready var music = preload("res://art/music/mapa.wav")

func _ready():
	AudioPlayer.play_music(music, 0.0)
	placeLevelsRandomly()
	connectLevels()
	
func placeLevelsRandomly():
	var minX = 20
	var maxX = size.x - 20
	var minY = 20
	var maxY = size.y - 20 
	var lastPosition = Vector2(minX, randf_range(minY, maxY))
	
	for i in range(levelCount):
		var level = Level.new()
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
		line.width = 3
		line.z_index = -1
		add_child(line)
