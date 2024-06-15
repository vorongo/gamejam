extends CharacterBody2D
var r = randf_range(1,3)
var speed = 300
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	velocity.x -= speed
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	move_and_slide()


