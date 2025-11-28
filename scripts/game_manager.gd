extends Node

var score : int = 0
@onready var score_label: Label = $"../UI/ScoreLabel"



func add_point():
	score += 1
	score_label.text = " coins:" + str(score)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
