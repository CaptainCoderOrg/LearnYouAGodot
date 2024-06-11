class_name AudioSingleton
extends Node

var path = "user://audio_settings.tres"
var audio_settings := AudioSettings.new()

@export var music_volume : float = 0.25:
	set(value):
		music_volume = value
		audio_settings.music_volume = music_volume
		var bix = AudioServer.get_bus_index("Music")
		AudioServer.set_bus_volume_db(bix, linear_to_db(music_volume))
		music_volume_changed.emit(music_volume)

@export var sfx_volume : float = 0.25:
	set(value):
		sfx_volume = value
		audio_settings.sfx_volume = sfx_volume
		var bix = AudioServer.get_bus_index("SFX")
		AudioServer.set_bus_volume_db(bix, linear_to_db(sfx_volume))
		sfx_volume_changed.emit(sfx_volume)

signal music_volume_changed(volume : float)
signal sfx_volume_changed(volume : float)

func _ready():
	load_audio_settings()
	
func load_audio_settings():
	if ResourceLoader.exists(path):
		var loaded = ResourceLoader.load(path)
		music_volume = loaded.music_volume
		sfx_volume = loaded.sfx_volume
		
func save_audio_settings():
	ResourceSaver.save(audio_settings, path)
