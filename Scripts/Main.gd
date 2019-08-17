extends Node2D

onready var menuIndex = 0
onready var selectionRect = $UI/Control/OuterRect
onready var moveSound = $UIMove
onready var selectSound = $UISelect

func _ready():
	OS.set_window_size(Vector2(512, 512))
	OS.set_window_position((OS.get_screen_size() / 2.0) - (OS.get_window_size() / 2.0))

func updateSelectionRectangle():
	if menuIndex == 0:
		selectionRect.rect_global_position = Vector2(14, 35)
	elif menuIndex == 1:
		selectionRect.rect_global_position = Vector2(14, 44)
	elif menuIndex == 2:
		selectionRect.rect_global_position = Vector2(14, 53)

func _process(delta):
	if Input.is_action_just_pressed("main_action"):
		selectSound.play()
		if menuIndex == 0:
			get_tree().change_scene("res://Scenes/Gameplay.tscn")
		elif menuIndex == 1:
			get_tree().change_scene("res://Scenes/ControlsScreen.tscn")
		elif menuIndex == 2:
			get_tree().quit()
	
	if Input.is_action_just_pressed("move_down"):
		menuIndex += 1
		moveSound.play()
	if Input.is_action_just_pressed("move_up"):
		menuIndex -= 1
		moveSound.play()
	menuIndex %= 3
	if menuIndex < 0:
		menuIndex = 2
	updateSelectionRectangle()