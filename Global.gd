extends Node

var winner = "Player 1"
var round_number = 1
var coin_p1 = 0
var coin_p2 = 0

var ball_by = ""

var level_winner = {"1":"", "2":"", "3":""}

const power_dict = {
	'enlarge': ['res://simple-ping-pong-2Dgame-assets/go-big.png'],
	'fasten': ['res://simple-ping-pong-2Dgame-assets/go-fast.png'],
	'make-small': ['res://simple-ping-pong-2Dgame-assets/make-small.png'],
	'pull-ball': ['res://simple-ping-pong-2Dgame-assets/pull-ball.png'],
}

var p1_powerups = []
var p2_powerups = []

func _power_activate(powerup: String, player: int) -> void:
	if player == 1:
		if powerup in p1_powerups:
			give_powerup(powerup, get_node("Player1"))
			p1_powerups.erase(powerup)
			print("Player 1 activated powerup: ", powerup)
	else:
		if powerup in p2_powerups:
			give_powerup(powerup, get_node("Player2"))
			p2_powerups.erase(powerup)
			print("Player 2 activated powerup: ", powerup)
var ball_on_paddle = true

func give_powerup(powerup: String, player: CharacterBody2D) -> void:
	if powerup == "enlarge":
		player.scale *= 1.5
	elif powerup == "fasten":
		player.speed *= 1.5
	elif powerup == "make-small":
		player.scale *= 0.5
	elif powerup == "pull-ball":
		# Implement pull ball logic here
		print("Pull ball powerup activated for player: ", player.name)
	else:
		print("Unknown powerup: ", powerup)