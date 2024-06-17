extends Node2D

var ghost = preload("res://ghost.tscn")
var bat = preload("res://bat.tscn")
var t_scene = preload("res://spawn_t.tscn")

# Аннотации @onready для ссылок на узлы
@onready var r1 = $r1
@onready var r2 = $r2
@onready var r3 = $r3
@onready var r4 = $r4
@onready var r5 = $r5
@onready var r6 = $r6
@onready var r7 = $r7
@onready var r8 = $r8
@onready var r9 = $r9
@onready var r10 = $r10
@onready var r11 = $r11
var ray
func _ready():
	# Подключаем сигнал timeout таймера к методу _on_timer_timeout
	$Timer.timeout.connect(_on_timer_timeout)
	$Timer.start()

func spawn():
	var r = randi() % 3
	
	if r == 0:
		r = randi() % 5
		if r == 0:
			ray = $r1
		elif r == 1:
			ray = $r2
		elif r == 2:
			ray = $r3
		elif r == 3:
			ray = $r4
		elif r == 4:
			ray = $r5
		print(r)
		var g = ghost.instantiate()  # Создаем экземпляр призрака
		owner.add_child(g)  # Добавляем призрака как дочерний узел
		g.global_transform = ray.global_transform  # Устанавливаем глобальное преобразование для призрака
	elif r == 1:
		r = randi() % 3
		if r == 0:
			ray = $r9
		elif r == 1:
			ray = $r10
		elif r == 2:
			ray = $r11
		var b = bat.instantiate()  # Создаем экземпляр летучей мыши
		owner.add_child(b)  # Добавляем летучую мышь как дочерний узел
		b.global_transform = ray.global_transform  # Устанавливаем глобальное преобразование для летучей мыши
	else:
		r = randi() % 3
		if r == 0:
			ray = $r6
		elif r == 1:
			ray = $r7
		elif r == 2:
			ray = $r8
		var t = t_scene.instantiate()  # Создаем экземпляр объекта spawn_t
		owner.add_child(t)  # Добавляем объект spawn_t как дочерний узел
		t.global_transform = ray.global_transform  # Устанавливаем глобальное преобразование для объекта spawn_t
	$Timer.start()  # Перезапускаем таймер

func _on_timer_timeout():
	spawn()  # Вызываем функцию spawn при срабатывании таймера
