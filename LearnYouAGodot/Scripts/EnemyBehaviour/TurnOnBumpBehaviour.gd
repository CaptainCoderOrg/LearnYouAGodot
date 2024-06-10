class_name TurnOnBumpBehaviour
extends Node

@export var movement_controller : MovementController

func _ready():
	movement_controller.on_collision.connect(handle_collision)
	
func handle_collision(collision : KinematicCollision2D):
	if collision.get_normal().x > .8:
		movement_controller.direction = 1;
	elif collision.get_normal().x < -.8:
		movement_controller.direction = -1;
