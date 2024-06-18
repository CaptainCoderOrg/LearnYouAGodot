class_name ExplosionParticleHandler
extends Node

@export var explosion_particles: PackedScene
@export var sprite: AnimatedSprite2D
@export var character: CharacterBody2D
## Probability of the body exploding. Float value between 0 and 1 (inclusive).
@export var explosion_rarity: float = 0.01
@onready var living_behaviour: LivingBehaviour = $"../LivingBehaviour"


func _ready():
	living_behaviour.died.connect(_parent_died)

func _parent_died():
	var chance: float = randf()
	if chance <= explosion_rarity:
		explode()
		if character:
			character.visible = false

func explode():
	var _particle: GPUParticles2D = explosion_particles.instantiate()
	_particle.position = sprite.global_position
	_particle.rotation = sprite.global_rotation
	_particle.emitting = true
	get_tree().get_root().add_child(_particle)
	await _particle.finished
	_particle.queue_free()
