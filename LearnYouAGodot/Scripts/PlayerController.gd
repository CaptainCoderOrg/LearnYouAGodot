class_name PlayerController
extends Node

@export var STATS: PlayerStats
@export var character: CharacterBody2D
@export var JUMP_VELOCITY = -400.0
@export var movementController : MovementController

signal direction_changed(direction : float)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	direction_changed.connect(movementController.set_direction)

func _physics_process(delta):
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and character.is_on_floor():
		character.velocity.y = JUMP_VELOCITY
		
	direction_changed.emit(Input.get_axis("ui_left", "ui_right"))
