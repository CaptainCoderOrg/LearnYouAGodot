extends Node2D

@export var level_scene : PackedScene

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene_to_packed(level_scene)
		
