class_name SettingsMenuController
extends Node

@onready var sfx_slider = %"SFX Slider"
@onready var music_slider = %"Music Slider"

func _ready():
	music_slider.value = __audio.music_volume
	sfx_slider.value = __audio.sfx_volume

func _on_music_slider_value_changed(value):
	__audio.music_volume = value


func _on_sfx_slider_value_changed(value):
	__audio.sfx_volume = value
