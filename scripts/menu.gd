extends Control

func _ready() -> void:
	var video_settings = ConfigFileHandler.load_video_setting()
	var audio_settings = ConfigFileHandler.load_audio_setting()
	if video_settings.fullscreen :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"),audio_settings.master_volume)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"),audio_settings.music_volume)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"),audio_settings.sfx_volume)
	print("Load config successfully.")

func _on_play_pressed() -> void:
	# get_tree().change_scene_to_file("res://scenes/Game/UI/level_select.tscn")
	get_tree().change_scene_to_file("res://scenes/Game/UI/level_select.tscn")
	print("Enter the play.")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Game/index/optionsMenu.tscn")
	print("Enter the options.")

func _on_quit_pressed() -> void:
	get_tree().quit()
	print("Quit the game.")
