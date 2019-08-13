extends Node2D

func _ready():
	OS.set_window_size(Vector2(512, 512))
	OS.set_window_position((OS.get_screen_size() / 2.0) - (OS.get_window_size() / 2.0))

func _draw():
	draw_rect(Rect2(0, 0, 64, 64), Color(20/255, 12/255, 28/255))

func _process(delta):
	update()
	if Input.is_action_just_pressed("main_action"):
		get_tree().change_scene("res://Scenes/Gameplay.tscn")