extends Node2D

const power_dict = Global.power_dict

# Player 1 Controls
const P1_LEFT = "ui_p1_left"
const P1_RIGHT = "ui_p1_right"
const P1_BUY = "ui_p1_buy"

# Player 2 Controls
const P2_LEFT = "ui_p2_left"
const P2_RIGHT = "ui_p2_right"
const P2_BUY = "ui_p2_buy"

var p1_powerups = []
var p2_powerups = []

var p1_index = 0
var p2_index = 0

var p1_ready = false
var p2_ready = false

func _ready():
	var p1_powerups = []
	var keys = power_dict.keys()
	keys.shuffle()
	p1_powerups = [keys[0], keys[1]]
	var hbox = $shop_p1

	for i in range(p1_powerups.size()):
		var powerup = p1_powerups[i]
		var button = Button.new()
		button.text = powerup
		button.icon = load(power_dict[powerup][0])
		button.name = powerup
		# button.connect("pressed", self, "_on_p1_powerup_pressed", [powerup])
		hbox.add_child(button)
	var button_play = Button.new()
	button_play.text = "Play"
	button_play.name = "play1"
	hbox.add_child(button_play)

	var p2_powerups = []
	p2_powerups = [keys[2], keys[3]]
	hbox = $shop_p2
	for i in range(p2_powerups.size()):
		var powerup = p2_powerups[i]
		var button = Button.new()
		button.text = powerup
		button.icon = load(power_dict[powerup][0])
		button.name = powerup
		# button.connect("pressed", self, "_on_p2_powerup_pressed", [powerup])
		hbox.add_child(button)
	var button_play2 = Button.new()
	button_play2.text = "Play"
	button_play2.name = "play2"
	hbox.add_child(button_play2)

func _process(delta: float) -> void:
	# Player 1 navigation
	if Input.is_action_just_pressed(P1_LEFT):
		self.p1_index = (self.p1_index - 1) % 3
		$shop_p1.get_child(self.p1_index).grab_focus()
	elif Input.is_action_just_pressed(P1_RIGHT):
		self.p1_index = (self.p1_index + 1) % 3
		$shop_p1.get_child(self.p1_index).grab_focus()
	elif Input.is_action_just_pressed(P1_BUY):
		if $shop_p1.get_child(self.p1_index).name == "play1":
			p1_ready = true
		else:
			var selected_powerup = $shop_p1.get_child(self.p1_index).name
			if selected_powerup in p1_powerups:
				print("Player 1 already has this powerup: ", selected_powerup)
			else:
				if Global.coin_p1 < power_dict[selected_powerup][1]:
					print("Player 1 does not have enough coins for this powerup: ", selected_powerup)
				else:
					Global.coin_p1 -= power_dict[selected_powerup][1]
					p1_powerups.append(selected_powerup)
					print("Player 1 bought: ", p1_powerups)

	

	# Player 2 navigation
	if Input.is_action_just_pressed(P2_LEFT):
		self.p2_index = (self.p2_index - 1) % 3
		$shop_p2.get_child(self.p2_index).grab_focus()
	elif Input.is_action_just_pressed(P2_RIGHT):
		self.p2_index = (self.p2_index + 1) % 3
		$shop_p2.get_child(self.p2_index).grab_focus()
	elif Input.is_action_just_pressed(P2_BUY):
		if $shop_p2.get_child(self.p2_index).name == "play2":
			p2_ready = true
		else:
			var selected_powerup = $shop_p2.get_child(self.p2_index).name
			if selected_powerup in p2_powerups:
				print("Player 2 already has this powerup: ", selected_powerup)
			else:
				# Add the selected powerup to the player's list
				if Global.coin_p2 < power_dict[selected_powerup][1]:
					print("Player 2 does not have enough coins for this powerup: ", selected_powerup)
				else:
					Global.coin_p2 -= power_dict[selected_powerup][1]
					p2_powerups.append(selected_powerup)
					print("Player 2 bought: ", p2_powerups)
	if p1_ready and p2_ready:
		Global.p1_powerups = p1_powerups
		Global.p2_powerups = p2_powerups
		print("Player 1 Powerups: ", Global.p1_powerups)
		print("Player 2 Powerups: ", Global.p2_powerups)
		get_tree().change_scene_to_file("res://game.tscn")
