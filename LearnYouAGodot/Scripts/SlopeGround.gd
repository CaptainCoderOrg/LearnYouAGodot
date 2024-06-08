extends Path2D

@export_category("Slope2D")

@onready var _collision_polygon = $"Ground (StaticBody2D)/CollisionPolygon2D"

func _ready():
	_bake_slope()

func _bake_slope() -> void:
	curve.add_point(curve.get_point_position(curve.point_count - 1) + Vector2(0, 500))
	curve.add_point(curve.get_point_position(0) + Vector2(0, 500))
	curve.add_point(curve.get_point_position(0))
	_collision_polygon.polygon = curve.tessellate(5, 2)

func _draw():
	#for point in _collision_polygon.polygon:
		#draw_circle(point, 1, Color.WHITE)
	draw_polygon(_collision_polygon.polygon, [Color("565a75")])
