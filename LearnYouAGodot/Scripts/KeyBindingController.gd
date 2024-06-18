extends NinePatchRect

@export var event_name : StringName
@onready var label = %Label


func _ready():
	var events = InputMap.action_get_events(event_name)
	for event in events:
		if event is InputEventKey:
			label.text = event.as_text_physical_keycode()
