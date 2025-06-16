extends Node2D

const p1_deck_left = 'deck_left'
const p1_deck_right = 'deck_right'

var p1_deck_index = 0

const p2_deck_left = 'deck_left_2'
const p2_deck_right = 'deck_right_2'

var p2_deck_index = 0


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

func _process(delta: float) -> void:
	if $p1_powerups.get_child_count() > 0:
		var texture_rect_card_selector = TextureRect.new()
		texture_rect_card_selector.texture = load("res://simple-ping-pong-2Dgame-assets/card_selector.png")
		texture_rect_card_selector.name = "card_selector"
		texture_rect_card_selector.visible = true
		texture_rect_card_selector.global_position  = $p1_powerups.get_child(p1_deck_index).get_global_position()
		if Input.is_action_just_pressed(p1_deck_left):
			p1_deck_index = p1_deck_index - 1  % $p1_powerups.get_child_count()
			texture_rect_card_selector.global_position  = $p1_powerups.get_child(p1_deck_index).get_global_position()

		if Input.is_action_just_pressed(p1_deck_right):
			p1_deck_index = p1_deck_index + 1 % $p1_powerups.get_child_count()
			texture_rect_card_selector.global_position  = $p1_powerups.get_child(p1_deck_index).get_global_position()
	if $p2_powerups.get_child_count() > 0:
		var texture_rect_card_selector_2 = TextureRect.new()
		texture_rect_card_selector_2.texture = load("res://simple-ping-pong-2Dgame-assets/card_selector.png")
		texture_rect_card_selector_2.name = "card_selector_2"
		texture_rect_card_selector_2.visible = true
		texture_rect_card_selector_2.global_position  = $p2_powerups.get_child(p2_deck_index).get_global_position()
		if Input.is_action_just_pressed(p2_deck_left):
			p2_deck_index = p2_deck_index - 1  % $p2_powerups.get_child_count()
			texture_rect_card_selector_2.global_position  = $p2_powerups.get_child(p2_deck_index).get_global_position()
		if Input.is_action_just_pressed(p2_deck_right):
			p2_deck_index = p2_deck_index + 1 % $p2_powerups.get_child_count()
			texture_rect_card_selector_2.global_position  = $p2_powerups.get_child(p2_deck_index).get_global_position()
