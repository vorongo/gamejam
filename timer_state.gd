extends Node2D

var timer_max =0
var ghostD = 0
@export var number = 1
var game_state = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func chek_time(elapsed_time):
	if elapsed_time > timer_max:
		timer_max = elapsed_time
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_state == false:
		ghostD = 0

func ghost_d():
	if game_state == true:
		ghostD += number
