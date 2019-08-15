extends StaticBody2D

export (bool) var isActive = true

onready var isActivated = true

onready var Sprite = $Sprite

func _ready():
	Sprite.frame = 0
	isActivated = isActive
	# Hacky way of making the object update correctly
	offscreenToggle()
	offscreenToggle()

func offscreenToggle():
	isActivated = not isActivated
	if isActivated:
		Sprite.frame = 0
		set_collision_layer_bit(0, true)
	else:
		Sprite.frame = 1
		set_collision_layer_bit(0, false)