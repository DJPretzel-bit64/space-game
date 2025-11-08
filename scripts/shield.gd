class_name Shield

extends Node2D

@export var rad_speed: float = 10.0
var mouse_active := true

func _process(delta: float):
	if mouse_active:
		var mouse_pos := get_viewport().get_mouse_position() - Vector2(get_viewport().size) / 2
		var target = atan2(mouse_pos.y, mouse_pos.x)
		
		rotation = lerp_angle(rotation, target, rad_speed * delta)
	
	if Input.is_action_pressed("left"):
		rotation = fmod(rotation - rad_speed * delta, 2 * PI)
		mouse_active = false
	if Input.is_action_pressed("right"):
		rotation = fmod(rotation + rad_speed * delta, 2 * PI)
		mouse_active = false
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		mouse_active = true
