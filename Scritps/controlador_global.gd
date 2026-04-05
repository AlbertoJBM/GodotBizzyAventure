extends Node
signal muertes_actualizado

var muertes: int = 0
var nivel: int

func _sumarMuerte():
	muertes += 1
	muertes_actualizado.emit()
