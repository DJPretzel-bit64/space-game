extends AudioStreamPlayer

const level_music = preload("res://Music/Tame Impala - Dracula (Lyrics) - TrendingTracks.mp3")

func _play_music(music: AudioStream):
	if stream == music:
		return
	stream = music
	play()
	
func play_level_music():
	_play_music(level_music)
