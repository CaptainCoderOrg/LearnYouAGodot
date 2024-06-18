class_name PlayerController
extends Node

@export var STATS: PlayerStats
@export var character: CharacterBody2D
@export var JUMP_VELOCITY = -400.0
@export var JUMP_MULTIPLIER = 16
@export var movementController : MovementController
@export var run_mulitiplier = 1.2
@export var coyote_frames = 8
var jump_frames = 2


signal direction_changed(direction : float)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	direction_changed.connect(movementController.set_direction)
	
func _process(delta):
	if Input.is_action_pressed("run"):
		movementController.multiplier = run_mulitiplier
	else:
		movementController.multiplier = 1

func can_jump():
	return jump_frames > 0

func _physics_process(delta):
	if character.is_on_floor():
		jump_frames = coyote_frames
	else:
		jump_frames -= 1

	if Input.is_action_just_pressed("jump") and can_jump():
		character.velocity.y = JUMP_VELOCITY * JUMP_MULTIPLIER
		jump_frames = 0
	
	direction_changed.emit(Input.get_axis("left", "right"))
