# SettingsManager.gd
extends Node

const SETTINGS_PATH = "res://settings/settings.cfg"
# 设置数据
var settings = {
	"audio": {
		"master_volume": 1.0,
		"music_volume": 1.0,
		"sfx_volume": 1.0
	},
	"video": {
		"fullscreen": false
	}
}

func _ready():
	load_settings()

# 保存设置到文件
func save_settings():
	var config = ConfigFile.new()
	
	for section in settings.keys():
		for key in settings[section].keys():
			config.set_value(section, key, settings[section][key])
	
	config.save(SETTINGS_PATH)
	print("设置已保存")

# 从文件加载设置
func load_settings():
	var config = ConfigFile.new()
	var err = config.load(SETTINGS_PATH)
	
	if err == OK:
		for section in settings.keys():
			for key in settings[section].keys():
				var value = config.get_value(section, key, settings[section][key])
				settings[section][key] = value
		print("设置已加载")
		apply_settings()
	else:
		print("未找到设置文件，使用默认设置")
		save_settings()

# 应用设置到游戏
func apply_settings():
	# 应用音频设置
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(settings["audio"]["master_volume"]))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(settings["audio"]["music_volume"]))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(settings["audio"]["sfx_volume"]))
	
	# 应用视频设置
	if settings["video"]["fullscreen"]:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

# 更新特定设置值
func update_setting(section: String, key: String, value):
	if settings.has(section) and settings[section].has(key):
		settings[section][key] = value
		save_settings()
		apply_settings()

# 获取特定设置值
func get_setting(section: String, key: String):
	if settings.has(section) and settings[section].has(key):
		return settings[section][key]
	return null
