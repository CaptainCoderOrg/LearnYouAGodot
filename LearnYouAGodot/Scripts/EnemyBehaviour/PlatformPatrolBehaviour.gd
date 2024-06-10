class_name PlatformPatrolBehaviour
extends Node

@onready var character_body : CharacterBody2D = $".."
@onready var movement_controller : MovementController = $"../MovementController"
@onready var platform_check : Node2D = $"../PlatformCheck"
@onready var raycast_2d : RayCast2D = $"../PlatformCheck/RayCast2D"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if character_body.is_on_floor() and not raycast_2d.is_colliding():
		movement_controller.direction = -movement_controller.direction
	platform_check.scale.x = -movement_controller.direction
