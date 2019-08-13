extends Node

onready var currentLevel = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func nextLevel():
	currentLevel += 1
	get_tree().get_root().get_node("Gameplay").moveToLevel(currentLevel)