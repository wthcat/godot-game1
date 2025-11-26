extends Node

var score : int = 0
@onready var score_label: Label = $ScoreLabel


func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Game/index/mainMenu.tscn")
