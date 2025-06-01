extends Area2D

var coin_count = 0

func _ready():
	# Optional: destroy coin after 5 seconds if not collected
	await get_tree().create_timer(5.0).timeout
	if is_instance_valid(self):
		queue_free()

func _on_body_entered(body:Node2D) -> void:
	if body.name == "ball":  # Replace "Player" with your player node's name
		# You can add score logic here
		if Global.ball_by == 'player_1':
			Global.coin_p1 += 1
			coin_count = Global.coin_p1
			get_node("../p1coins").text = str(coin_count)
		else:
			Global.coin_p2 += 1
			coin_count = Global.coin_p2
			get_node("../p2coins").text = str(coin_count)
		queue_free()
