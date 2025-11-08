class_name Asteroid

extends Node2D

# define variables we need
var direction: Vector2
@export var textures: Array[Texture2D]
@export var speed: float = 250.0

var rng = RandomNumberGenerator.new()

func _ready():
	$Sprite2D.texture = textures[rng.randi_range(0, textures.size() - 1)]
	rotation = randf_range(0, 2 * PI)
	speed *= rng.randf_range(0.5, 1.5)

# function to update every frame
func _process(delta):
	# move in the direction we want to move
	position += direction * speed * delta

func hit(area: Area2D):
	if area.get_parent() is Shield:
		queue_free()
		
		var camera := get_viewport().get_camera_2d()
		if camera is CameraShake:
			camera.apply_shake(5)
