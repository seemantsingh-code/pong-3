extends Area2D

var ball
var score = 0

func _ready() -> void:
	ball = get_node("../ball") # Adjust the path to your

func _on_body_entered(body:Node2D) -> void:
	ball._reset_ball()
	score += 1
	if score > 10:
		Global.winner = "Player 2"
		get_tree().change_scene_to_file("res://end.tscn")
	else:
		get_node("../p1score").text = str(score)
