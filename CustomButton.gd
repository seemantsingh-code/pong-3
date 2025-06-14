# CustomButton.gd
extends Button

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_select"):
		# Block Enter/Space default behavior
		get_viewport().set_input_as_handled()
