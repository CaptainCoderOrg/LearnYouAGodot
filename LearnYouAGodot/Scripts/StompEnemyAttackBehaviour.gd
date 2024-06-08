class_name StompEnemyAttackBehaviour
extends Node

@export var movement_controller : MovementController

# Called when the node enters the scene tree for the first time.
func _ready():
	movement_controller.on_collision.connect(check_stomp)


func check_stomp(collision : KinematicCollision2D):
	var collider = collision.get_collider()
	if collider.is_in_group("StompableEnemy") and is_beneath(collision.get_normal()):
		movement_controller.character.velocity.y = -500

func is_beneath(normal : Vector2):
	return abs(rad_to_deg(Vector2.UP.angle_to(normal))) < 20
