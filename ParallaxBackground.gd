extends ParallaxBackground

# Коэффициент скорости для параллакса (можно настроить по вашему усмотрению)
var parallax_speed = 0.15

# Сохраняем размер экрана для вычислений
var screen_size = Vector2()

func _ready():
	# Получаем размер экрана и конвертируем в Vector2
	var viewport_size = get_viewport().size
	screen_size = Vector2(viewport_size.x, viewport_size.y)
	# Подписываемся на обновления процесса
	set_process(true)

func _process(delta):
	# Получаем позицию мыши в мировых координатах
	var mouse_pos = get_viewport().get_mouse_position()
	
	# Вычисляем смещение параллакса на основе позиции мыши
	var base_offset = (mouse_pos - screen_size / 2) * parallax_speed
	
	# Устанавливаем смещение параллакса для каждого слоя
	for layer in get_children():
		if layer is ParallaxLayer:
			var layer_parallax_speed = layer.motion_scale * parallax_speed
			layer.motion_offset = base_offset * layer_parallax_speed
