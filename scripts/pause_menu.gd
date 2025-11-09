extends Control

func _ready():
	$pauseBg.visible = false

func _on_pause_pressed():
	get_tree().paused = true
	$pauseBg.visible = true

func _on_resume_pressed():
	get_tree().paused = false
	$pauseBg.visible = false

func _on_menu_pressed():
	print("exit")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
