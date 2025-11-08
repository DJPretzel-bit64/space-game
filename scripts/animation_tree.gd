extends AnimationTree

@onready var anim_tree = $AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self._process(0)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var fade_value: float = 1.0
	var fade_speed: float = 0.2
	var direction: int = 1	
	
	fade_value += direction * fade_speed * delta
	
	if fade_value >= 1.0:
		fade_value = 1.0
		direction = -1
	elif fade_value <= 0.0:
		fade_value = 0.0
		direction = 1
		
	anim_tree.set("parameters/Blend1&2/blend_amount", clamp(fade_value * 2.0, 0.0, 1.0))
	anim_tree.set("parameters/Blend2&3/blend_amount", clamp((fade_value - 0.5) * 2.0, 0.0, 5.0))
