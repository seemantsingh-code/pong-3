extends Node2D

const power_dict = {
	'enlarge': ['res://simple-ping-pong-2Dgame-assets/go-big.png'],
	'fasten': ['res://simple-ping-pong-2Dgame-assets/go-fast.png'],
	'make-small': ['res://simple-ping-pong-2Dgame-assets/make-small.png'],
	'pull-ball': ['res://simple-ping-pong-2Dgame-assets/pull-ball.png'],
}

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
		var selected_powerup = $shop_p1.get_child(self.p1_index).name
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
		var selected_powerup = $shop_p2.get_child(self.p2_index).name
		p2_powerups.append(selected_powerup)
		print("Player 2 bought: ", p2_powerups)
