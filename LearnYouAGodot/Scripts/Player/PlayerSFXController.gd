class_name PlayerSFXController
extends Node

@onready var splat_death = %SplatDeath
@onready var respawn = %Respawn
@onready var regular_death = %RegularDeath



func _on_living_behaviour_died():
	regular_death.play()


func _on_living_behaviour_spawn():
	respawn.play()
