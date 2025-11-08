class_name Shield

extends Node2D

func _process(_delta: float):
	look_at(get_viewport().get_mouse_position() - Vector2(get_viewport().size) / 2)
