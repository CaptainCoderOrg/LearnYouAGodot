class_name CheckPointBehaviour
extends Node

@export var area_2d : Area2D
@export var animation : AnimatedSprite2D
@export var spawn_point : Node2D

var is_collected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	area_2d.body_entered.connect(check_collect)
	area_2d.body_exited.connect(reset)
	animation.animation_finished.connect(switch_animation)
	animation.animation = "idle"
	animation.play()

func reset(body : Node2D):
	var timer : SceneTreeTimer = get_tree().create_timer(5, false)
	timer.timeout.connect(do_reset)
	
func do_reset():
	is_collected = false
	animation.animation = "collect"
	animation.play_backwards()

func switch_animation():
	if animation.animation == "collect" and not is_collected:
		animation.animation = "idle"
		animation.play()	

func check_collect(body : Node2D):
	if body.is_in_group("Player") and not is_collected:
		var livingBehaviour : LivingBehaviour = body.get_node("LivingBehaviour")
		livingBehaviour.spawn_point = spawn_point
		animation.animation = "collect"
		animation.play()
		is_collected = true
