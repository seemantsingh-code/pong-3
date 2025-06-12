extends Node2D

const P1_LEFT = "ui_p1_left"
const P1_RIGHT = "ui_p1_right"
const P1_PLAY = "ui_p1_down"
const P2_LEFT = "ui_p2_left"
const P2_RIGHT = "ui_p2_right"
const P2_PLAY = "ui_p2_down"

const p1_buttons = ["buy-1", "buy-3", "play-1"]
const p2_buttons = ["buy-4", "buy-5", "play-2"]

var p1_index = 0
var p2_index = 0

var label_1: Label
var label_2: Label



func _ready() -> void:
    print("Shop scene is ready")
    label_1 = get_node(p1_buttons[p1_index])
    label_1.label_settings.font_color = Color(0, 1, 0)  # Green color
    print("Label 1 color set to green")
    label_2 = get_node(p2_buttons[p2_index])
    label_2.label_settings.font_color = Color(1, 0, 0)  # Red color
    print("Label 2 color set to red")

func _process(delta: float) -> void:
    # Handle player input for navigation
    if Input.is_action_just_pressed(P1_LEFT):
        print("Player 1 moved left")
        p1_index = max(p1_index - 1, 0)
        for i in range(len(p1_buttons)):
            get_node(p1_buttons[i]).label_settings.font_color = Color(1, 1, 1)  # Reset to white
        label_1 = get_node(p1_buttons[p1_index])
        label_1.label_settings.font_color = Color(0, 1, 0)
    elif Input.is_action_just_pressed(P1_RIGHT):
        print("Player 1 moved right")
        p1_index = min(p1_index + 1, len(p1_buttons) - 1)
        for i in range(len(p1_buttons)):
            get_node(p1_buttons[i]).label_settings.font_color = Color(1, 1, 1)  # Reset to white
        label_1 = get_node(p1_buttons[p1_index])
        label_1.label_settings.font_color = Color(0, 1, 0)
    elif Input.is_action_just_pressed(P1_PLAY):
        print("Player 1 moved down")
        p1_index = min(p1_index + 1, len(p1_buttons) - 1)
        for i in range(len(p1_buttons)):
            get_node(p1_buttons[i]).label_settings.font_color = Color(1, 1, 1)  # Reset to white
        label_1 = get_node(p1_buttons[p1_index])
        label_1.label_settings.font_color = Color(0, 1, 0)

    if Input.is_action_just_pressed(P2_LEFT):
        print("Player 2 moved left")
        label_2 = get_node("buy-4")
        label_2.label_settings.font_color = Color(1, 0, 0)
    elif Input.is_action_just_pressed(P2_RIGHT):
        print("Player 2 moved right")
        label_2 = get_node("buy-5")
        label_2.label_settings.font_color = Color(1, 0, 0)
    elif Input.is_action_just_pressed(P2_PLAY):
        print("Player 2 pressed play")
        label_2 = get_node("play-2")
        label_2.label_settings.font_color = Color(1, 0, 0)