class_name LivingBehaviour
extends Node

@export var is_alive : bool = true
@export var character_body : CharacterBody2D
@export var movement_controller : MovementController


func kill():
	if is_alive:
		is_alive = false
		movement_controller.direction = 0
		character_body.collision_layer = 0
		character_body.collision_mask = 0
		character_body.velocity.y = -300
		var timer : SceneTreeTimer = get_tree().create_timer(5, false)
		timer.timeout.connect(get_parent().queue_free)
