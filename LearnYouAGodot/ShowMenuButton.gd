extends Button

@export var audio_settings : AudioSettings
@onready var panel_container = $"../../PanelContainer"

func _on_pressed():
	panel_container.visible = not panel_container.visible
	if (not panel_container.visible):
		print("Saving settings")
		ResourceSaver.save(audio_settings, "user://audio_settings.tres")
