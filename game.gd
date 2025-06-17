extends Node2D

const p1_deck_left = 'deck_left'
const p1_deck_right = 'deck_right'

var p1_deck_index = 0

const p2_deck_left = 'deck_left_2'
const p2_deck_right = 'deck_right_2'

const p1_use_card = 'use_card'
const p2_use_card = 'use_card_2'

var p2_deck_index = 0

var card_selector_p1: TextureRect
var card_selector_p2: TextureRect

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
	
	if $p1_powerups.get_child_count() > 0:
		card_selector_p1 = TextureRect.new()
		card_selector_p1.texture = load("res://simple-ping-pong-2Dgame-assets/card_selector.png")
		card_selector_p1.name = "card_selector"
		card_selector_p1.size = $p1_powerups.get_child(0).size
		card_selector_p1.visible = false
		add_child(card_selector_p1)

	if $p2_powerups.get_child_count() > 0:
		card_selector_p2 = TextureRect.new()
		card_selector_p2.texture = load("res://simple-ping-pong-2Dgame-assets/card_selector.png")
		card_selector_p2.name = "card_selector_2"
		card_selector_p2.size = $p2_powerups.get_child(0).size
		card_selector_p2.visible = false
		add_child(card_selector_p2)

func _process(delta: float) -> void:
	if $p1_powerups.get_child_count() > 0:
		if Input.is_action_just_pressed(p1_deck_left):
			p1_deck_index = (p1_deck_index - 1) % $p1_powerups.get_child_count()
			print("P1 Deck Index: ", p1_deck_index)
			card_selector_p1.global_position  = $p1_powerups.get_child(p1_deck_index).get_global_position()
			card_selector_p1.visible = true

		if Input.is_action_just_pressed(p1_deck_right):
			p1_deck_index = (p1_deck_index + 1) % $p1_powerups.get_child_count()
			print("P1 Deck Index: ", p1_deck_index)
			card_selector_p1.global_position  = $p1_powerups.get_child(p1_deck_index).get_global_position()
			card_selector_p1.visible = true

		if Input.is_action_just_pressed(p1_use_card) and not Global.ball_on_paddle:
			var selected_powerup = $p1_powerups.get_child(p1_deck_index)
			print("P1 using powerup: ", selected_powerup.name)
			Global._power_activate(selected_powerup.name, 1)  # Activate the powerup for Player 1
			selected_powerup.queue_free()  # Example: remove the powerup after use
			card_selector_p1.visible = false
		
	if $p2_powerups.get_child_count() > 0:
		if Input.is_action_just_pressed(p2_deck_left):
			p2_deck_index = (p2_deck_index - 1) % $p2_powerups.get_child_count()
			print("P2 Deck Index: ", p2_deck_index)
			card_selector_p2.global_position  = $p2_powerups.get_child(p2_deck_index).get_global_position()
			card_selector_p2.visible = true
		if Input.is_action_just_pressed(p2_deck_right):
			p2_deck_index = (p2_deck_index + 1) % $p2_powerups.get_child_count()
			print("P2 Deck Index: ", p2_deck_index)
			card_selector_p2.global_position  = $p2_powerups.get_child(p2_deck_index).get_global_position()
			card_selector_p2.visible = true
		if Input.is_action_just_pressed(p2_use_card) and not Global.ball_on_paddle:
			var selected_powerup = $p2_powerups.get_child(p2_deck_index)
			print("P2 using powerup: ", selected_powerup.name)
			Global._power_activate(selected_powerup.name, 2)  # Activate the powerup for Player 2
			selected_powerup.queue_free()  # Example: remove the powerup after use
			card_selector_p2.visible = false
