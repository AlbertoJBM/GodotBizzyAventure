extends Node2D

@export var Controlador_Partida: ControladorPartida
@export var niveles: Array[PackedScene]
var nivel_actual:  int = 1
var nivel_instanciado: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ControladorGlobal.nivel > 1:
		_cargar_nivel()
	else:
		_crear_nivel(nivel_actual)
	
func _crear_nivel(numero_nivel: int):
	nivel_instanciado = niveles[numero_nivel -1].instantiate()
	add_child(nivel_instanciado)
	
	var hijos := nivel_instanciado.get_children()
	for i in hijos.size():
		if hijos[i].is_in_group("personajes"):
			hijos[i].personaje_muerto.connect(_reiniciar_nivel)
			break
		
	ControladorGlobal.nivel = numero_nivel
	Controlador_Partida.guardar_partida()
	
func _eliminar_nivel():
	nivel_instanciado.queue_free() #funcion para eliminar nodos en Godot

func _reiniciar_nivel():
	_eliminar_nivel()
	_crear_nivel.call_deferred(nivel_actual)
	
func siguiente_nivel():
	nivel_actual += 1
	_eliminar_nivel()
	_crear_nivel.call_deferred(nivel_actual)
	
func _cargar_nivel():
	nivel_actual = ControladorGlobal.nivel
	_crear_nivel.call_deferred(nivel_actual)
