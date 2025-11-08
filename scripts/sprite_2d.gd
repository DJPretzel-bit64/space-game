extends Sprite2D

#@onready var background = $Background
#@onready var timer = $Timer

#var backgrounds = [
	#preload("res://textures/background1.png"),
	#preload("res://textures/background2.png"),
	#preload("res://textures/background3.png")
#]

#var current_index = 0

#func _ready():
	#background.texture = backgrounds[current_index].get_image()
	#timer.wait_time = 3.0 # change image every 3 seconds
	#timer.start()
	#timer.timeout.connect(_on_timer_timeout)

#func _on_timer_timeout():
#	current_index = (current_index + 1) % backgrounds.size()
#	background.texture = backgrounds[current_index]
