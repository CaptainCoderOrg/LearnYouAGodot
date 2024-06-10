class_name KillPlayerOnTouchBehaviour
extends Node

@export var area_2d : Area2D


func _ready():
	area_2d.body_entered.connect(handle_body_entered)
	
func handle_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		var livingBehaviour = body.get_node("LivingBehaviour")
		if livingBehaviour is PlayerLivingBehaviour:
			livingBehaviour.kill()
		
