class_name ContenedorMonedas
extends Node

var total_monedas: int
var monedas_recogidas: int


func _ready() -> void:
	var monedas:= get_children()
	total_monedas = monedas.size()
	
	for moneda in monedas:
		moneda.contenedor_monedas = self
		 
func moneda_recogida():
	monedas_recogidas += 1
	if monedas_recogidas == total_monedas:
		get_parent().get_parent().siguiente_nivel()
		print("nivel superado")
