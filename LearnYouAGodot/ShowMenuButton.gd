extends Button

@onready var panel_container = $"../../PanelContainer"

func _on_pressed():
	panel_container.visible = not panel_container.visible
	if (not panel_container.visible):
		__audio.save_audio_settings()
