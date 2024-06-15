extends CharacterBody2D


var SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity.x -= SPEED * delta
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	move_and_slide()

func  dead():
	SPEED = 0
	$CollisionShape2D.disabled = true
	$AnimationPlayer.play("dead")
	$Timer.start()


func _on_timer_timeout():
	queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.dead()

