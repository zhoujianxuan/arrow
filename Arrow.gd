extends Node2D

@export var distance:float = 600.;
@export var fly_time:float = 1.5;
@export var grivity:float = 980.;

var velocity:Vector2: #当前速度
	set(val):
		velocity = val
		rotation = velocity.angle()

func _ready():
	velocity = Vector2(
		distance / fly_time,
		-0.5 * grivity * fly_time
	)

func _physics_process(delta):
	velocity.y += grivity * delta # v = v0+at
	global_position += velocity * delta


func _on_area_2d_body_entered(body):
	set_physics_process(false)
	var tween := create_tween()
	tween.tween_interval(randf_range(0.5, 0.8))
	tween.tween_property(self, "modulate:a", 0, 2.)
	await tween.finished
	queue_free()
