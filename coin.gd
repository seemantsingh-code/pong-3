extends Area2D

func _ready():
    # Optional: destroy coin after 5 seconds if not collected
    await get_tree().create_timer(5.0).timeout
    if is_instance_valid(self):
        queue_free()

func _on_Coin_body_entered(body):
    if body.name == "Player":  # Replace "Player" with your player node's name
        # You can add score logic here
        queue_free()
