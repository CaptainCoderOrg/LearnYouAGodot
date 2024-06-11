class_name AudioSettings
extends Resource

@export var music_volume : float = 0.25:
	set(value):
		music_volume = value
		var bix = AudioServer.get_bus_index("Music")
		AudioServer.set_bus_volume_db(bix, db_to_linear(music_volume))
		music_volume_changed.emit(music_volume)

@export var sfx_volume : float = 0.25:
	set(value):
		sfx_volume = value
		var bix = AudioServer.get_bus_index("SFX")
		AudioServer.set_bus_volume_db(bix, db_to_linear(sfx_volume))
		sfx_volume_changed.emit(sfx_volume)

signal music_volume_changed(volume : float)
signal sfx_volume_changed(volume : float)
