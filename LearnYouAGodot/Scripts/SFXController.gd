class_name SFXController
extends Node

@onready var sfxr_stream_player = $"../SfxrStreamPlayer"
@export var audio_settings : AudioSettings

func _ready():
	sfxr_stream_player.volume_db =  linear_to_db(audio_settings.sfx_volume)
	audio_settings.sfx_volume_changed.connect(update_volume)
	
func update_volume(volume):
	sfxr_stream_player.volume_db =  linear_to_db(audio_settings.sfx_volume)
