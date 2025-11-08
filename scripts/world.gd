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
		recompute_collision_shape()

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

func recompute_collision_shape():
	var texture: Texture = $Sprite2D.texture
	
	for child in $Area2D.get_children():
		child.queue_free()
	
	var bm = BitMap.new()
	bm.create_from_image_alpha(texture.get_image())
	# in the original script, it was Rect2(position.x, position.y ...)
	var rect = Rect2(0, 0, texture.get_width(), texture.get_height())
	# change (rect, 2) for more or less precision
	# for ex. (rect, 5) will have the polygon points spaced apart more
	# (rect, 0.0001) will have points spaced very close together for a precise outline
	var my_array = bm.opaque_to_polygons(rect, 2)
	# optional - check if opaque_to_polygons() was able to get data
#		print(my_array)
	var my_polygon = Polygon2D.new()
	my_polygon.set_polygons(my_array)
	var offsetX = 0
	var offsetY = 0
	if (texture.get_width() % 2 != 0):
		offsetX = 1
	if (texture.get_height() % 2 != 0):
		offsetY = 1
	for i in range(my_polygon.polygons.size()):
		var my_collision = CollisionPolygon2D.new()
		my_collision.set_polygon(my_polygon.polygons[i])
		my_collision.position -= Vector2((texture.get_width() / 2) + offsetX, (texture.get_height() / 2) + offsetY) * scale.x
		my_collision.scale = scale
		$Area2D.call_deferred("add_child", my_collision)
