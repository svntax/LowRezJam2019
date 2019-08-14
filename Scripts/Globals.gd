extends Node

onready var currentLevel = 0

func nextLevel():
	currentLevel += 1
	get_tree().get_root().get_node("Gameplay").moveToLevel(currentLevel)