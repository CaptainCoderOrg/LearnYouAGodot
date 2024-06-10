class_name MovementController
extends Node

@export var character : CharacterBody2D
@export var direction : float
@export var SPEED : float
var multiplier : float = 1

signal on_collision(collision : KinematicCollision2D)

# Get the gravity from the project settings to be synced with RigidBody nodes.
static var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func speed():
	return SPEED * multiplier

func set_direction(p_direction : float):
	direction = p_direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Add the gravity.
	if not character.is_on_floor():
		character.velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.	
	if direction:
		character.velocity.x = direction * speed()
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, speed())
	
	if character.move_and_slide():
		for c_ix in character.get_slide_collision_count():
			var collision : KinematicCollision2D = character.get_slide_collision(c_ix)
			on_collision.emit(collision)
