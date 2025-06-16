extends Node2D

func _ready() -> void:
	# Initialize the game state or any necessary variables here
	print("Game is ready!")
	var vbox_p1 = $p1_powerups

	var p1_powerups = Global.p1_powerups
	for powerup in p1_powerups:
		var texture_rect = TextureRect.new()
		texture_rect.texture = load(Global.power_dict[powerup][0])
		print("Loading texture for powerup: ", powerup, " with path: ", Global.power_dict[powerup][0])
		texture_rect.name = powerup
		# texture_rect.expand = true
		# texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		vbox_p1.add_child(texture_rect)
		print("Added powerup: ", powerup, " to Player 1's powerups.")
	
	var vbox_p2 = $p2_powerups
	var p2_powerups = Global.p2_powerups
	for powerup in p2_powerups:
		var texture_rect = TextureRect.new()
		texture_rect.texture = load(Global.power_dict[powerup][0])
		print("Loading texture for powerup: ", powerup, " with path: ", Global.power_dict[powerup][0])
		texture_rect.name = powerup
		# texture_rect.expand = true
		# texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		vbox_p2.add_child(texture_rect)
		print("Added powerup: ", powerup, " to Player 2's powerups.")
