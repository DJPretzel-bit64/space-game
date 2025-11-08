extends Node2D

# define variables needed by this class
@export var asteroid_spawn_distance: int = 500
@export var asteroid_scene: PackedScene
@export var crater_radius: int = 15

# get a random number generator
var rng = RandomNumberGenerator.new()

# define a function to spawn asteroids, this is tied to the AsteroidSpawnTimer timeout signal
func spawn_asteroid():
	# generate a random unit vector for the direction we want to spawn the asteroid
	var direction = Vector2(rng.randf_range(-1.0, 1.0), rng.randf_range(-1.0, 1.0)).normalized()
	
	# convert that direction to a position
	var asteroid_position = asteroid_spawn_distance * direction
	
	# instantiate the asteroid to spawn it
	var asteroid : Asteroid = asteroid_scene.instantiate()
	
	# set the asteroid's position
	asteroid.position = asteroid_position
	
	# set the asteroid's direction (difference between us and the asteoid)
	asteroid.direction = (position - asteroid.position).normalized()
	
	# add the asteroid to our parent (the root node)
	get_parent().add_child(asteroid)

func on_hit(body: Area2D):
	if body.get_parent() is Asteroid:
		var asteroid = body.get_parent() as Asteroid
		asteroid.queue_free()
		
		hollow_texture(asteroid.position)

func hollow_texture(crater_position: Vector2):
	var image: Image = $Sprite2D.texture.get_image()
	var image_size: Vector2 = $Sprite2D.texture.get_size()
	
	for i in range(-crater_radius, crater_radius):
		for j in range(-crater_radius, crater_radius):
			var pos := crater_position + image_size / 2 + Vector2(j, i)
			if i * i + j * j < crater_radius * crater_radius and 0 <= pos.x and pos.x < image_size.x and 0 <= pos.y and pos.y < image_size.y:
				image.set_pixelv(pos, Color(0, 0, 0, 0))
	
	var texture := ImageTexture.create_from_image(image)
	$Sprite2D.texture = texture
	
