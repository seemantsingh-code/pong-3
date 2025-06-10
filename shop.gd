extends Node2D

func _ready() -> void:
    print("Shop scene is ready")
    var label_1 = get_node("buy-1")
    label_1.label_settings.font_color = Color(0, 1, 0)  # Green color
    print("Label 1 color set to green")
    var label_2 = get_node("buy-3")
    label_2.label_settings.font_color = Color(1, 0, 0)  # Red color
    print("Label 2 color set to red")