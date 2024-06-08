extends Node
class_name SlopedCharacterController

@export var characterBody: CharacterBody2D
@export var sprite: AnimatedSprite2D
@export var ray: RayCast2D

func rotate_sprite():
	if characterBody.is_on_floor():
		var new_rotation = atan2(ray.get_collision_normal().y, ray.get_collision_normal().x) + PI/2
		sprite.rotation = lerp_angle(sprite.rotation, new_rotation, 0.1)
	else:
		sprite.rotation = lerp_angle(sprite.rotation, 0, 0.1)

func _physics_process(delta):
	rotate_sprite()
