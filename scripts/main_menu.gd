extends Control

func _ready() -> void:
	AudioPlayer.play_level_music()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/setting.tscn")


func _on_credits_pressed() -> void:
	$CenterContainer/MainButtons.visible = false
	$CenterContainer/CreditsMenu.visible = true


func _on_back_pressed() -> void:
	$CenterContainer/CreditsMenu.visible = false
	$CenterContainer/MainButtons.visible = true
