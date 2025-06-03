extends Area2D

var ball
var score = 0

func _ready() -> void:
	ball = get_node("../ball") # Adjust the path to your

	
func _on_body_entered(body:Node2D) -> void:
	ball._reset_ball()
	score += 1
	if score > 5:
		if Global.round_number < 3:
			Global.round_number += 1
			Global.coin_p1 = 0
			Global.coin_p2 = 0
			Global.ball_by = ""
			score = 0
			get_node("../p1score").text = str(0)
			get_node("../round_label").text = "Round: " + str(Global.round_number)
		else:
			Global.winner = "Player 1"
			get_tree().change_scene_to_file("res://end.tscn")
	else:
		get_node("../p1score").text = str(score)
