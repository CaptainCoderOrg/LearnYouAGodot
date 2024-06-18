extends NinePatchRect

@export var event_name : StringName
@onready var label = %Label


func _ready():
	var events = InputMap.action_get_events(event_name)
	for event in events:
		if event is InputEventKey:
			label.text = event.as_text_physical_keycode()


func _on_button_pressed():
	__read_key_modal.visible = true
	var key_event = await __read_key_modal.on_key_pressed
	var events = InputMap.action_get_events(event_name)
	for event in events:
		if event is InputEventKey:
			InputMap.action_erase_event(event_name, event)
	InputMap.action_add_event(event_name, key_event)
	label.text = key_event.as_text_physical_keycode()
