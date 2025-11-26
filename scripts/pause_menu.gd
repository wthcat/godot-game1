extends CanvasLayer

@onready var pause_panel: Panel = $Control/PausePanel

func _ready() -> void:
	unpause()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE and event.pressed:
			if not get_tree().paused:
				pause()
			else:
				unpause()


func pause():
	get_tree().paused = true
	pause_panel.visible = true

func unpause():
	get_tree().paused = false
	pause_panel.visible = false
	
func quit_game():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Game/index/mainMenu.tscn")
	
