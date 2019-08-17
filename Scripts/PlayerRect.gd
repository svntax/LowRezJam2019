extends Node2D

func _process(delta):
	update()

func _draw():
	draw_rect(Rect2(-16, -16, 32, 32), Color("#6abe30"), false)
	draw_line(Vector2(-16, 16), Vector2(-16, 17), Color("#6abe30"))