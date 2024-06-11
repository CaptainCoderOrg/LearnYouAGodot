class_name LivingBehaviour
extends Node

@export var is_alive : bool = true
@export var respawn_time : float = 5
@export var movement_controller : MovementController
@export var spawn_point : Node2D
@export var body : CharacterBody2D
@export var respawn_animation : AnimatedSprite2D
@onready var sfxr_stream_player = %SfxrStreamPlayer

var _collision_layers
var _collision_mask

signal died
signal spawn

func _ready():
	_collision_layers = body.collision_layer
	_collision_mask = body.collision_mask
	respawn_animation.hide()

func kill():
	if is_alive:
		if sfxr_stream_player: sfxr_stream_player.play()
		is_alive = false
		died.emit()
		movement_controller.direction = 0
		_collision_layers = body.collision_layer
		body.collision_layer = 0
		_collision_mask = body.collision_mask
		body.collision_mask = 0
		body.velocity.y = -300
		var timer : SceneTreeTimer = get_tree().create_timer(respawn_time, false)
		await timer.timeout
		respawn()

func respawn():
	respawn_animation.play()
	respawn_animation.show()
	body.hide()
	body.global_position = spawn_point.global_position
	await respawn_animation.animation_finished
	spawn.emit()
	body.show()
	is_alive = true
	body.velocity.y = 0
	body.global_position = spawn_point.global_position
	movement_controller.direction = 1
	body.collision_layer = _collision_layers
	body.collision_mask = _collision_mask
	respawn_animation.hide()
	

func on_timeout():
	get_parent().queue_free()
