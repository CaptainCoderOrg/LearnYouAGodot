extends Node2D

@export var level_scene : PackedScene

func _input(event):
	if event.is_action_pressed("jump"):
		get_tree().change_scene_to_packed(level_scene)		
