extends Control

onready var Gameplay = get_tree().get_root().get_node("Gameplay")

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if Gameplay.state == Gameplay.State.PAUSED:
			Gameplay.setState(Gameplay.State.GAMEPLAY)
		elif Gameplay.state == Gameplay.State.GAMEPLAY:
			Gameplay.setState(Gameplay.State.PAUSED)