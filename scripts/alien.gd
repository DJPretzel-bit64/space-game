extends Node2D

var distance: float = 500
var rot_speed: float = 250
var speed = 10

func _process(delta: float):
	$Sprite2D.position = Vector2.from_angle(rotation) * distance
	$Sprite2D.rotation = rotation + PI / 2
	$Area2D.position = Vector2.from_angle(rotation) * distance
	rotation += (rot_speed * delta) / distance
	if distance > 120:
		distance -= speed * delta
