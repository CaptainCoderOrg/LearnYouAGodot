class_name AnimatedCharacterController
extends Node

@export var character : CharacterBody2D
@export var animated_sprite : AnimatedSprite2D
@export var flip_h : bool

func update_facing():
	if character.velocity.x < 0:
		animated_sprite.flip_h = not flip_h
	elif character.velocity.x > 0:
		animated_sprite.flip_h = flip_h

func update_animation():
	if character.velocity.x == 0:
		animated_sprite.animation = "idle"
	else:
		animated_sprite.animation = "walk"
	animated_sprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	update_facing()
	update_animation()