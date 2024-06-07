extends Label

@export var stats : PlayerStats


# Called when the node enters the scene tree for the first time.
func _ready():
	stats.coins_updated.connect(update_text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_text(coins):
	text = "Coins: %s" % coins
