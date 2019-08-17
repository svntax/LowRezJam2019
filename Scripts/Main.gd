extends Node2D

onready var menuIndex = 0
onready var selectionRect = $UI/Control/OuterRect
onready var moveSound = $UIMove
onready var selectSound = $UISelect

func _ready():
	OS.set_window_size(Vector2(512, 512))
	OS.set_window_position((OS.get_screen_size() / 2.0) - (OS.get_window_size() / 2.0))

func _draw():
	#draw_rect(Rect2(0, 0, 64, 64), Color(20/255, 12/255, 28/255))
	pass

func updateSelectionRectangle():
	if menuIndex == 0:
		selectionRect.rect_global_position = Vector2(19, 45)
	elif menuIndex == 1:
		selectionRect.rect_global_position = Vector2(19, 53)

func _process(delta):
	#update()
	if Input.is_action_just_pressed("main_action"):
		selectSound.play()
		if menuIndex == 0:
			get_tree().change_scene("res://Scenes/Gameplay.tscn")
		elif menuIndex == 1:
			get_tree().quit()
	
	if Input.is_action_just_pressed("move_down"):
		menuIndex += 1
		moveSound.play()
	if Input.is_action_just_pressed("move_up"):
		menuIndex -= 1
		moveSound.play()
	menuIndex %= 2
	if menuIndex < 0:
		menuIndex = 1
	updateSelectionRectangle()