extends ParallaxLayer

# Скорости движения для каждого слоя параллакса
const layer_speeds = [
	Vector2(50, 0),   # Слой 0: скорость (50, 0) по X
	Vector2(30, 0),   # Слой 1: скорость (30, 0) по X
	Vector2(20, 0)    # Слой 2: скорость (20, 0) по X
	# добавьте скорости для остальных слоев, если они есть
]

func _process(delta):
	for i in range(get_child_count()):
		var layer = get_child(i)
		# Получаем текущую скорость для слоя
		var speed = layer_speeds[i]
		# Двигаем слой параллакса
		layer.position.x -= speed.x * delta
