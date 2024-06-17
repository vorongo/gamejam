extends Node2D

@onready var timer = $Timer
@onready var label = $Label
@onready var label2 = $Label2
var elapsed_time: float = 0.0
var ghostD_now = 0
func _ready():
	label2.text = str(TimerState.timer_max)
	# Подключаем сигнал таймера к функции _on_Timer_timeout с использованием Callable
	timer.timeout.connect(_on_Timer_timeout)
	# Запускаем таймер (если он не настроен на автозапуск)
	timer.start()

func _process(delta):
	# Обновляем текст метки каждую секунду
	if ghostD_now < TimerState.ghostD:
		elapsed_time += TimerState.ghostD
		ghostD_now = TimerState.ghostD
	label.text = str(elapsed_time)

# Функция для обновления времени при срабатывании таймера
func _on_Timer_timeout():
	elapsed_time += timer.wait_time


func _on_character_body_2d_dead_p():
	timer.stop()
	TimerState.chek_time(elapsed_time)
	label2.text = str(TimerState.timer_max)
