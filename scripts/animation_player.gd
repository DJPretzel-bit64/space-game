extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
#	set_default_blend_time(5) #sets blend time for blending between backgrounds
#	current_animation = "background_switch_1" #sets the first animation
#	var i = 100 #for making sure there is not an infinite loop
	#switches between each animation automatically as each one ends while the game is being played
#	while  (i >= 0):
#		animation_set_next("background_switch_2", "background_switch_1")
#		animation_set_next("background_switch_3", "background_switch_2")
#		animation_set_next("background_switch_1", "background_switch_3")
#		i = i - 1
#		



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
