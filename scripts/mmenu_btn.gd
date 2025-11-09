extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#changes scene to the main menu
func _on_pressed() -> void:
	print("main menu pressed")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
