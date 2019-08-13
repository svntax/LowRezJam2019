extends Area2D

signal levelFinished

onready var Sprite = $Sprite
onready var AnimationPlayer = $AnimationPlayer

onready var isActive = false

func _ready():
	Sprite.frame = 0

func offscreenToggle():
	isActive = not isActive
	if isActive:
		Sprite.frame = 1
		AnimationPlayer.play("active")
	else:
		AnimationPlayer.stop()
		Sprite.frame = 0

func _on_LevelExit_body_entered(body):
	if body.get_name() == "Player" and isActive:
		emit_signal("levelFinished")
