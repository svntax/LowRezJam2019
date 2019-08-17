extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("main_action"):
		get_tree().change_scene("res://Scenes/Main.tscn")