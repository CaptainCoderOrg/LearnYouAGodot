class_name StompEnemyAttackBehaviour
extends Node

@export var movement_controller : MovementController
@export var player_controller : PlayerController
@export var bounce_force : float = -400

# Called when the node enters the scene tree for the first time.
func _ready():
	movement_controller.on_collision.connect(check_stomp)

func get_bounce_velocity():
	if Input.is_action_pressed("jump"):
		return bounce_force * player_controller.JUMP_MULTIPLIER
	else:
		return bounce_force * (player_controller.JUMP_MULTIPLIER / 2)

func check_stomp(collision : KinematicCollision2D):
	var collider = collision.get_collider()
	if collider.is_in_group("StompableEnemy") and is_beneath(collision.get_normal()):
		var livingBehaviour : LivingBehaviour = collider.get_node("LivingBehaviour")
		if livingBehaviour and livingBehaviour.is_alive:
			livingBehaviour.kill()
			movement_controller.character.velocity.y = get_bounce_velocity()

func is_beneath(normal : Vector2):
	return abs(rad_to_deg(Vector2.UP.angle_to(normal))) < 45
