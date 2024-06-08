class_name PatrollingAIBehaviour
extends Node

@export var movement_controller : MovementController
@export var shape_cast : ShapeCast2D

func _physics_process(delta):
	if shape_cast.is_colliding():
		movement_controller.direction = -movement_controller.direction

	if movement_controller.direction < 0:
		shape_cast.rotation = deg_to_rad(0)
	elif movement_controller.direction > 0:
		shape_cast.rotation = deg_to_rad(180)
