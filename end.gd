extends Control

@onready var result_label = $VBoxContainer/winLabel  # Adjust path if needed

func _ready() -> void:
    result_label.text = Global.winner + " Wins!"