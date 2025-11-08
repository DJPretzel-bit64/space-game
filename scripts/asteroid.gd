class_name Asteroid

extends Node2D

# define variables we need
var direction: Vector2
@export var speed: int = 250

# function to update every frame
func _process(delta):
	# move in the direction we want to move
	position += direction * speed * delta
