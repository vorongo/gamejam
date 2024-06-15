extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _on_area_2d_body_entered(body):
	if body.is_in_group("enamy"):
		body.dead()

func dead():
	pass
