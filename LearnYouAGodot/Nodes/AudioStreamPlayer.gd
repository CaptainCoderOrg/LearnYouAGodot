extends AudioStreamPlayer

@export var audio_settings : AudioSettings

func _ready():
	volume_db = linear_to_db(audio_settings.music_volume)
	audio_settings.music_volume_changed.connect(update_volume)

func update_volume(volume):
	volume_db = linear_to_db(volume)
