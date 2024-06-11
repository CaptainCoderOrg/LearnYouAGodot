class_name SettingsMenuController
extends Node

@export var audio_settings : AudioSettings
@onready var music_slider = $"../MarginContainer/VBoxContainer3/VBoxContainer/Music Slider"

func _enter_tree():
	load_audio_settings()

func _ready():
	music_slider.value = audio_settings.music_volume

func _on_music_slider_value_changed(value):
	audio_settings.music_volume = value


func _on_sfx_slider_value_changed(value):
	audio_settings.sfx_volume = value

func load_audio_settings():
	if ResourceLoader.exists("user://audio_settings.tres"):
		print("Loaded audio settings")
		var loaded = ResourceLoader.load("user://audio_settings.tres")
		print(audio_settings)
		audio_settings.music_volume = loaded.music_volume
		audio_settings.sfx_volume = loaded.sfx_volume
