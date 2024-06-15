extends Node2D
var r = randf_range(1.0,5.0)
var r2 = randf_range(1.0,3.0)
var ghost = preload("res://ghost.tscn")
var t = preload("res://spawn_t.tscn")
func _ready():
	$Timer.start()

func _process(delta):
	r = randf_range(1.0,5.0)
	r2 = randf_range(1.0,3.0)

func spawn():
	var ray = RayCast2D
	if r2 >= 1 and r2<2:
		if r >= 1 and r<2:
			ray = $r1
		elif r >= 2 and r<3:
			ray = $r2
		elif r >= 3 and r<4:
			ray = $r3
		elif r >= 4 and r<5:
			ray = $r4
		else:
			ray = $r5
		var g = ghost.instantiate()
		owner.add_child(g)
		g.transform = ray.global_transform
		$Timer.start()
	else:
		r2 = randf_range(1.0,3.0)
		if r >= 1 and r<2:
			ray = $r6
		elif r >= 2 and r<3:
			ray = $r7
		else:
			ray = $r8
		var t = t.instantiate()
		owner.add_child(t)
		t.transform = ray.global_transform
	print(r2)


func _on_timer_timeout():
	spawn()
