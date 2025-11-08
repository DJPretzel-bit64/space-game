extends Button

@onready var pauseMenu = $/root/Game/pausePopUp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().paused = true
	pauseMenu.visible = true
	pass # Replace with function body.
