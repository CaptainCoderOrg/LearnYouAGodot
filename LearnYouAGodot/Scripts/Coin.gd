extends Area2D

@export var stats : PlayerStats

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	stats.set_coins(stats.coins + 1)
	print(stats.coins)
	queue_free()
