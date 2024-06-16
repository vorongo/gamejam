extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("new_animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://lavel.tscn")



func _on_button_2_pressed():
	$Button2.visible = false
	$Button.visible = false
	$Button3.visible = true


func _on_button_3_pressed():
	$Button2.visible = true
	$Button.visible = true
	$Button3.visible = false
