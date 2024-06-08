class_name MovementController
extends Node

@export var character : CharacterBody2D
@export var direction : float
@export var SPEED : float

# Get the gravity from the project settings to be synced with RigidBody nodes.
static var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func set_direction(p_direction : float):
	direction = p_direction

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Add the gravity.
	if not character.is_on_floor():
		character.velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.	
	if direction:
		character.velocity.x = direction * SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, SPEED)
	character.move_and_slide()
