extends KinematicBody2D

onready var CurrentLevel = get_parent()
onready var Gameplay = CurrentLevel.get_parent().get_parent()
onready var AnimationPlayer = $AnimationPlayer
onready var Sprite = $Sprite

const SPEED = 4 #24

onready var dx = 0
onready var dy = 0
onready var direction = 1 #1 = right, -1 = left

func _ready():
	AnimationPlayer.playback_speed = 2

func move_short():
	move_and_collide(Vector2(dx * SPEED, dy * SPEED))

func updateDirection():
	if dx < 0:
		direction = -1
		Sprite.set_flip_h(true)
	elif dx > 0:
		direction = 1
		Sprite.set_flip_h(false)

func _physics_process(delta):
	dx = 0
	dy = 0
	if CurrentLevel.gameState == CurrentLevel.State.PLAYING:
		if Input.is_action_just_pressed("move_left"):
			dx -= 1
		if Input.is_action_just_pressed("move_right"):
			dx += 1
		if Input.is_action_just_pressed("move_up"):
			dy -= 1
		if Input.is_action_just_pressed("move_down"):
			dy += 1
		updateDirection()
		if !test_move(transform, Vector2(dx * SPEED, dy * SPEED)):
			#move_and_collide(Vector2(dx * SPEED, dy * SPEED))
			if dx != 0 or dy != 0:
				Gameplay.incrementMoves()
			move_short()
			if (dx != 0 or dy != 0) and not AnimationPlayer.is_playing():
				AnimationPlayer.play("move")
			