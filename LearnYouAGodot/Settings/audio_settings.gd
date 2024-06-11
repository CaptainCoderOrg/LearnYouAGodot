class_name AudioSettings
extends Resource

@export var music_volume : float = 0.25:
	set(value):
		music_volume = value
		music_volume_changed.emit(music_volume)

@export var sfx_volume : float = 0.25:
	set(value):
		sfx_volume = value
		sfx_volume_changed.emit(sfx_volume)

signal music_volume_changed(volume : float)
signal sfx_volume_changed(volume : float)
