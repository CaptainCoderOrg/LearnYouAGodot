extends Area2D

@export var stats : PlayerStats

func _on_body_entered(body):
	stats.set_coins(stats.coins + 1)
	queue_free()
