extends Area2D

var ball
var score = 0

func _ready() -> void:
	ball = get_node("../ball") # Adjust the path to your

	
func _on_body_entered(body:Node2D) -> void:
	ball._reset_ball()
	score += 1
	get_node("../p1score").text = str(score) 
