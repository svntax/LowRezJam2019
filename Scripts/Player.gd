extends KinematicBody2D

onready var Gameplay = get_parent()

const SPEED = 4 #24

onready var dx = 0
onready var dy = 0

func _ready():
	pass

func _process(delta):
	update()

func _draw():
	draw_rect(Rect2(-16, -16, 32, 32), Color("#6abe30"), false)
	draw_rect(Rect2(-16, 16, 1, 1), Color("#6abe30"), false)

func _physics_process(delta):
	dx = 0
	dy = 0
	if Gameplay.gameState == Gameplay.State.PLAYING:
#		if Input.is_action_pressed("move_left"):
#			dx -= 1
#		if Input.is_action_pressed("move_right"):
#			dx += 1
#		if Input.is_action_pressed("move_up"):
#			dy -= 1
#		if Input.is_action_pressed("move_down"):
#			dy += 1
		#move_and_slide(Vector2(dx * SPEED, dy * SPEED)
		if Input.is_action_just_pressed("move_left"):
			dx -= 1
		if Input.is_action_just_pressed("move_right"):
			dx += 1
		if Input.is_action_just_pressed("move_up"):
			dy -= 1
		if Input.is_action_just_pressed("move_down"):
			dy += 1
		if !test_move(transform, Vector2(dx * SPEED, dy * SPEED)):
			move_and_collide(Vector2(dx * SPEED, dy * SPEED))