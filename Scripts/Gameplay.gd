extends Node2D

var level00 = load("res://Levels/Level00.tscn")
var level01 = load("res://Levels/Level01.tscn")
var level02 = load("res://Levels/Level02.tscn")

enum State {GAMEPLAY, PAUSED}
onready var state = State.GAMEPLAY

onready var PauseMenu = $UI/PauseMenu
onready var LevelFinished = $LevelFinished
onready var moveSound = $UIMove
onready var selectSound = $UISelect

onready var numberOfMoves = 0

func _ready():
	Globals.currentLevel = 0

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		restartLevel()

func updateMovesLabel():
	$UI/MovesContainer/MovesLabel.set_text("Moves: " + str(numberOfMoves))

func incrementMoves():
	numberOfMoves += 1
	updateMovesLabel()

func restartLevel():
	moveToLevel(Globals.currentLevel)

func moveToLevel(level):
	for child in $LevelRoot.get_children():
		child.queue_free()
	var newLevel = null
	match level:
		0:
			newLevel = level00.instance()
		1:
			newLevel = level01.instance()
		2:
			newLevel = level02.instance()
		_:
			get_tree().change_scene("res://Scenes/EndScreen.tscn")
	if newLevel != null:
		$LevelRoot.add_child(newLevel)
	numberOfMoves = 0
	updateMovesLabel()

func setState(newState):
	state = newState
	match newState:
		State.GAMEPLAY:
			PauseMenu.hide()
			get_tree().paused = false
		State.PAUSED:
			PauseMenu.show()
			get_tree().paused = true
