class_name AnimatedCharacterController
extends Node

@export var character : CharacterBody2D
@export var animated_sprite : AnimatedSprite2D
@export var animation_player : AnimationPlayer
@export var flip_h : bool
@onready var living_behaviour = $"../LivingBehaviour"

func update_facing():
	if character.velocity.x < 0:
		animated_sprite.flip_h = not flip_h
	elif character.velocity.x > 0:
		animated_sprite.flip_h = flip_h

func update_animation():
	if animation_player:
		if living_behaviour.is_alive:
			animation_player.stop()
		else:
			animation_player.play("death_spin")
	if not living_behaviour.is_alive:
		animated_sprite.animation = "death"
	elif character.velocity.x == 0:
		animated_sprite.animation = "idle"
	else:
		animated_sprite.animation = "walk"
	animated_sprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	update_facing()
	update_animation()
