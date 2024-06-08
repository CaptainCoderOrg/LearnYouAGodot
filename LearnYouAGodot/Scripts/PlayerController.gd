extends CharacterBody2D

@onready var ray_cast = $RayCast2D
@onready var animated_sprite = $AnimatedSprite2D

@export var STATS: PlayerStats
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func rotate_sprite():
	if is_on_floor():
		var new_rotation = atan2(ray_cast.get_collision_normal().y, ray_cast.get_collision_normal().x) + PI/2
		animated_sprite.rotation = lerp_angle(animated_sprite.rotation, new_rotation, 0.1)
	else:
		animated_sprite.rotation = lerp_angle(animated_sprite.rotation, 0, 0.1)

func update_facing():
	if velocity.x < 0:
		animated_sprite.flip_h = true
	elif velocity.x > 0:
		animated_sprite.flip_h = false

func update_animation():
	if velocity.x == 0:
		animated_sprite.animation = "idle"
	else:
		animated_sprite.animation = "walk"
	animated_sprite.play()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	update_animation()
	update_facing()
	rotate_sprite()
	move_and_slide()
	

