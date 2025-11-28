extends Control

var colNum : int = 3
var width : int = 136
var currCol : int = 1

@onready var level_page: GridContainer = $LevelPage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#OS.center_window()
	var num = 1
	for x in level_page.get_children():
		x.setLevel(num)
		if num <= 5:
			x.setLock(false)
		else:
			x.setLock(true)
		num += 1


#func _on_btnLeft_pressed():
	#if currCol > 1:
		#currCol -= 1
		#var tween = create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
		#tween.tween_property(hbox, "rect_position:x", hbox.rect_position.x + width, 1)
		#
#func _on_btnRight_pressed():
	#if currCol<colNum:
		#currCol+=1
		#var tween =create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
		#tween.tween_property(hbox,"rect_position:x",hbox.rect_position.x-width ,1)


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Game/index/mainMenu.tscn")
