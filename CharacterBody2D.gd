extends CharacterBody2D

# Скорость движения персонажа
var speed = 15
var heath = 100
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var bullet = preload("res://bullet.tscn")

func _ready():
	$Timer.start()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("run")
		velocity.x += 1 * speed 
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("run")
		velocity.x -= 1 * speed 
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("run")
		velocity.y += 1 * speed 
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite2D.play("run")
		velocity.y -= 1 * speed 
	
	move_and_slide()
	clamp_player_to_camera_view()


func _on_timer_timeout():
	shoot()

func shoot():
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = $RayCast2D/Marker2D.global_transform

func damage(damage):
	heath -= damage

func clamp_player_to_camera_view():
	var position = global_position
	position.x = clamp(position.x, 10, 1152)
	position.y = clamp(position.y, 0, 648)
	global_position = position # Обновить global_position игрока

func dead():
	$AnimationPlayer.play("dead")
	$AnimationPlayer/Timer.start()

func _on_timer_timeout2():
	queue_free()
