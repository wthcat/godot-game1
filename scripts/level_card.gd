extends PanelContainer


@export var islock : bool = true
@export var levelNum : int = 1

@onready var level_num: Label = $LevelNum
@onready var lock: TextureRect = $Lock

func _ready() -> void:
	lock.visible = islock
	level_num.visible = !islock
	
# 检测锁定状态
func setLock(value:bool):
	islock = value
	lock.visible = islock
	level_num.visible = !islock
	
# 设置关卡数字
func setLevel(value):
	levelNum = value
	level_num.text = str(value)
	
# 点击事件
func _gui_input(event: InputEvent) -> void:
	if islock and event is InputEventMouseButton and event.is_pressed():
		print("Level ", levelNum, " is locked")
		return
	if event is InputEventMouseButton and event.is_pressed():
		var target : String = "res://scenes/Game/Level/game_" + str(levelNum) + ".tscn"
		get_tree().change_scene_to_file(target)
		print("Click level ", levelNum)
