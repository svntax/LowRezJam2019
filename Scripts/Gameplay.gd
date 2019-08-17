extends Node2D

var level00 = load("res://Levels/Level00.tscn")
var level01 = load("res://Levels/Level01.tscn")

enum State {GAMEPLAY, PAUSED}
onready var state = State.GAMEPLAY

onready var PauseMenu = $UI/PauseMenu
onready var LevelFinished = $LevelFinished

func _ready():
	pass

func moveToLevel(level):
	for child in $LevelRoot.get_children():
		child.queue_free()
	var newLevel = null
	match level:
		0:
			newLevel = level00.instance()
		1:
			newLevel = level01.instance()
	if newLevel != null:
		$LevelRoot.add_child(newLevel)

func setState(newState):
	state = newState
	match newState:
		State.GAMEPLAY:
			PauseMenu.hide()
			get_tree().paused = false
		State.PAUSED:
			PauseMenu.show()
			get_tree().paused = true
