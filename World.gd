extends Node2D

func _input(event):
	if event.is_action_pressed("click"):
		fire()
	
	

func fire():
	var num := 6
	for i in range(num):
		var arrow := (load("res://Arrow.tscn") as PackedScene).instantiate()
		add_child(arrow)
		arrow.global_position = $Sprite2D.global_position
		arrow.velocity = arrow.velocity.rotated((i - num/2) * 0.05 + randf_range(-0.1, 0.1))
