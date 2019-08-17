extends StaticBody2D

export (bool) var isActive = true

onready var isActivated = true

onready var Sprite = $Sprite
onready var SwitchSound = $SwitchSound
onready var AnimationPlayer = $AnimationPlayer

func _ready():
	Sprite.frame = 0
	isActivated = isActive
	# Hacky way of making the object update correctly
	offscreenToggle(false)
	offscreenToggle(false)

func offscreenToggle(playEffects = true):
	if playEffects:
		SwitchSound.play()
		AnimationPlayer.play("switch")
	isActivated = not isActivated
	if isActivated:
		Sprite.frame = 0
		set_collision_layer_bit(0, true)
	else:
		Sprite.frame = 1
		set_collision_layer_bit(0, false)