class_name LivingBehaviour
extends Node

@export var is_alive : bool = true
@export var respawn_time : float = 5
@export var character_body : CharacterBody2D
@export var movement_controller : MovementController
@export var spawn_point : Node2D
@export var body : CharacterBody2D

var _collision_layers
var _collision_mask

signal died

func kill():
	if is_alive:
		is_alive = false
		died.emit()
		movement_controller.direction = 0
		_collision_layers = character_body.collision_layer
		character_body.collision_layer = 0
		_collision_mask = character_body.collision_mask
		character_body.collision_mask = 0
		character_body.velocity.y = -300
		var timer : SceneTreeTimer = get_tree().create_timer(respawn_time, false)
		timer.timeout.connect(on_timeout)

func respawn():
	is_alive = true
	movement_controller.direction = 1
	character_body.collision_layer = _collision_layers
	character_body.collision_mask = _collision_mask
	body.global_position = spawn_point.global_position

func on_timeout():
	get_parent().queue_free()
