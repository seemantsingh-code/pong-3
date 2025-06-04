extends Button


func _on_pressed() -> void:
    Global.winner = "Player 1"
    Global.round_number = 1
    Global.coin_p1 = 0
    Global.coin_p2 = 0

    Global.ball_by = ""
    get_tree().change_scene_to_file("res://game.tscn")
