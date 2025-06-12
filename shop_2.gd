extends Control

# Player 1 Controls
const P1_LEFT = "ui_p1_left"
const P1_RIGHT = "ui_p1_right"
const P1_PLAY = "ui_p1_down"

# Player 2 Controls
const P2_LEFT = "ui_p2_left"
const P2_RIGHT = "ui_p2_right"
const P2_PLAY = "ui_p2_down"

# Store buttons in arrays for indexing
var p1_buttons = []
var p2_buttons = []

var p1_index = 0
var p2_index = 0

func _ready():
	# Populate button arrays
	p1_buttons = [$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Button, $HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/Button]
	p2_buttons = [$HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Button, $HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/Button]

	# Set P1 buttons to only accept focus manually
	for btn in p1_buttons:
		btn.focus_mode = Control.FOCUS_NONE

	# Set P2 buttons to only accept focus manually
	for btn in p2_buttons:
		btn.focus_mode = Control.FOCUS_NONE

	# Manually assign focus (only works with FOCUS_NONE + grab_focus)
	p1_buttons[p1_index].focus_mode = Control.FOCUS_ALL
	p2_buttons[p2_index].focus_mode = Control.FOCUS_ALL

	# Set initial focus
	p1_buttons[p1_index].grab_focus()
	p2_buttons[p2_index].grab_focus()

func _unhandled_input(event):
	# --- Player 1 Controls ---
	if Input.is_action_just_pressed(P1_LEFT):
		p1_buttons[p1_index].focus_mode = Control.FOCUS_NONE
		p1_index = max(p1_index - 1, 0)
		p1_buttons[p1_index].focus_mode = Control.FOCUS_ALL
		p1_buttons[p1_index].grab_focus()
	elif Input.is_action_just_pressed(P1_RIGHT):
		p1_buttons[p1_index].focus_mode = Control.FOCUS_NONE
		p1_index = min(p1_index + 1, p1_buttons.size() - 1)
		p1_buttons[p1_index].focus_mode = Control.FOCUS_ALL
		p1_buttons[p1_index].grab_focus()
	elif Input.is_action_just_pressed(P1_PLAY):
		$HBoxContainer/VBoxContainer/Button.grab_focus()

	# --- Player 2 Controls ---
	if Input.is_action_just_pressed(P2_LEFT):
		p2_buttons[p2_index].focus_mode = Control.FOCUS_NONE
		p2_index = max(p2_index - 1, 0)
		p2_buttons[p2_index].focus_mode = Control.FOCUS_ALL
		p2_buttons[p2_index].grab_focus()
	elif Input.is_action_just_pressed(P2_RIGHT):
		p2_buttons[p2_index].focus_mode = Control.FOCUS_NONE
		p2_index = min(p2_index + 1, p2_buttons.size() - 1)
		p2_buttons[p2_index].focus_mode = Control.FOCUS_ALL
		p2_buttons[p2_index].grab_focus()
	elif Input.is_action_just_pressed(P2_PLAY):
		$HBoxContainer2/VBoxContainer/Button.grab_focus()

# Connect the Play buttons in the editor to this function
func _on_PlayButtonP1_pressed():
	print("Player 1 pressed Play")
	# get_tree().change_scene_to_file("res://game.tscn")

func _on_PlayButtonP2_pressed():
	print("Player 2 pressed Play")
	# get_tree().change_scene_to_file("res://game.tscn")

func _on_button_pressed() -> void:
	pass # Replace with function body.
