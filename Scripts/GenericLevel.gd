extends Node2D

enum State {PLAYING, LEVEL_FINISHED}
onready var gameState = State.PLAYING

onready var Gameplay = get_tree().get_root().get_node("Gameplay")
onready var CameraArea = $CameraArea
onready var Player = $Player
onready var PlayerCamera = $Player/Camera2D
onready var LevelFinishedUI = get_tree().get_root().get_node("Gameplay/UI/LevelFinishedUI")
onready var LevelExit = $LevelExit

func _ready():
	LevelFinishedUI.hide()
	LevelExit.connect("levelFinished", self, "_on_LevelExit_levelFinished")
	CameraArea.connect("area_exited", self, "_on_CameraArea_area_exited")
	CameraArea.connect("body_exited", self, "_on_CameraArea_body_exited")

func _process(delta):
	if PlayerCamera != null:
		# Player-centered follow
		CameraArea.global_position = Player.global_position
		# Offscreen-based movement
		#CameraArea.global_position = PlayerCamera.get_camera_screen_center()
	
	handleStateLogic()

func setState(newState):
	var oldState = gameState
	gameState = newState
	match newState:
		State.PLAYING:
			LevelFinishedUI.hide()
		State.LEVEL_FINISHED:
			LevelFinishedUI.showUI()
			get_parent().get_parent().get_node("LevelFinished").play()

func handleStateLogic():
	match gameState:
		State.PLAYING:
			pass
		State.LEVEL_FINISHED:
			if Input.is_action_just_pressed("main_action"):
				var menuIndex = LevelFinishedUI.getMenuIndex()
				if menuIndex == 0:
					Gameplay.selectSound.play()
					Gameplay.restartLevel()
				elif menuIndex == 1:
					Gameplay.selectSound.play()
					Globals.nextLevel()

func handleOffscreenObject(obj):
	if obj.has_method("offscreenToggle"):
		obj.offscreenToggle()

func _on_CameraArea_body_exited(body):
	handleOffscreenObject(body)

func _on_CameraArea_area_exited(area):
	handleOffscreenObject(area)

func _on_LevelExit_levelFinished():
	setState(State.LEVEL_FINISHED)
