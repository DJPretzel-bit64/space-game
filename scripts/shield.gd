class_name Shield

extends Node2D

@export var rad_speed: float = 10.0

func _process(delta: float):
	var mouse_pos := get_viewport().get_mouse_position() - Vector2(get_viewport().size) / 2
	var target = atan2(mouse_pos.y, mouse_pos.x)
	
	rotation = lerp_angle(rotation, target, rad_speed * delta)
