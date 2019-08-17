extends Control

onready var Gameplay = get_tree().get_root().get_node("Gameplay")

onready var menuIndex = 1

func showUI():
	show()
	menuIndex = 1
	updateSelectionRectangle()

func updateSelectionRectangle():
	if menuIndex == 1:
		$RestartRect.hide()
		$NextRect.show()
	elif menuIndex == 0:
		$RestartRect.show()
		$NextRect.hide()

func _process(delta):
	if is_visible():
		if Input.is_action_just_pressed("move_right"):
			Gameplay.moveSound.play()
			menuIndex += 1
		if Input.is_action_just_pressed("move_left"):
			Gameplay.moveSound.play()
			menuIndex -= 1
	menuIndex %= 2
	if menuIndex < 0:
		menuIndex = 1
	updateSelectionRectangle()

func getMenuIndex():
	return menuIndex