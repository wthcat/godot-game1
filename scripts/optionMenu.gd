extends Node

# 引入节点
@onready var fullscreen_checkbox: CheckBox = $MarginContainer/VBoxContainer/Fullscreen_checkbox

@onready var master_vol_slider: HSlider = $MarginContainer/VBoxContainer/Master_Vol_Slider
@onready var music_vol_slider: HSlider = $MarginContainer/VBoxContainer/Music_Vol_Slider
@onready var sfx_vol_slider: HSlider = $MarginContainer/VBoxContainer/SFX_Vol_Slider

func _ready() -> void:
	var video_settings = ConfigFileHandler.load_video_setting()
	fullscreen_checkbox.button_pressed = video_settings.fullscreen
	
	var audio_settings = ConfigFileHandler.load_audio_setting()
	master_vol_slider.value = min(audio_settings.master_volume, 1.0)
	music_vol_slider.value = min(audio_settings.music_volume, 1.0)
	sfx_vol_slider.value = min(audio_settings.sfx_volume, 1.0)

# 返回设置
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.pressed:
			_on_back_pressed()

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Game/index/mainMenu.tscn")
# Called when the node enters the scene tree for the first time.


# 画面设置
func _on_full_screen_toggled(toggled_on: bool) -> void:
	ConfigFileHandler.save_video_setting("fullscreen", toggled_on)
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED) 


# 音频设置
func _on_main_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"),value)


func _on_music_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Music"),value)


func _on_sfx_vol_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"),value)


func _on_main_vol_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		ConfigFileHandler.save_audio_setting("master_volume", master_vol_slider.value)


func _on_music_vol_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		ConfigFileHandler.save_audio_setting("music_volume", music_vol_slider.value)


func _on_sfx_vol_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		ConfigFileHandler.save_audio_setting("sfx_volume", sfx_vol_slider.value)
