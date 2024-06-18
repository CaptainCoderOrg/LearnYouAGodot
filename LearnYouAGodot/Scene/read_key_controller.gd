extends CanvasLayer

signal on_key_pressed(event : InputEventKey)


func _input(event):
	if visible and event is InputEventKey:
		get_viewport().set_input_as_handled()
		on_key_pressed.emit(event)
		visible = false
