class_name PlayerStats
extends Resource

@export var health: int
@export var coins: int
@export var sub_resource: Resource
@export var strings: PackedStringArray

signal coins_updated(count: int)

func set_coins(p_coins):
	coins = p_coins
	coins_updated.emit(coins)
	

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_health = 0, p_coins = 0, p_sub_resource = null, p_strings = []):
	health = p_health
	coins = p_coins
	sub_resource = p_sub_resource
	strings = p_strings
