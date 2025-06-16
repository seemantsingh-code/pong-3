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
