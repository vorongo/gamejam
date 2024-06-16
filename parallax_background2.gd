extends ParallaxBackground

var speed = 100

func _physics_process(delta):
	scroll_offset.x -= speed * delta
