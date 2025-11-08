extends Node2D

# define variables needed by this class
@export var asteroid_spawn_distance: int = 500
@export var asteroid_scene: PackedScene

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
