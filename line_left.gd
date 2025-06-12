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
			print("Round: " + str(Global.round_number))
			Global.level_winner[str(Global.round_number)] = "Player 2"
			Global.round_number += 1
			Global.coin_p1 = 0
			Global.coin_p2 = 0
			Global.ball_by = ""
			score = 0
			get_node("../p2score").text = str(0)
			get_node("../round_label").text = "Round: " + str(Global.round_number)
			get_tree().change_scene_to_file("res://shop.tscn")
		else:
			Global.level_winner[str(Global.round_number)] = "Player 2"
			Global.winner = get_match_winner(Global.level_winner)
			get_tree().change_scene_to_file("res://end.tscn")
	else:
		get_node("../p2score").text = str(score)

func get_match_winner(level_winner: Dictionary) -> String:
	print(level_winner)
	var count_player1 = 0
	var count_player2 = 0

	for key in level_winner:
		var player = level_winner[key]
		if player == "Player 1":
			count_player1 += 1
		elif player == "Player 2":
			count_player2 += 1

	if count_player1 > count_player2:
		return "Player1"
	elif count_player2 > count_player1:
		return "Player2"
	else:
		return "Draw"