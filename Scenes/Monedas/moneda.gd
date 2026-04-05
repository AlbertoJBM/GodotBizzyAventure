extends Node2D
@export  var area2d: Area2D
@export var reproductor: AudioStreamPlayer2D
var contenedor_monedas: ContenedorMonedas

func _ready() -> void:
	area2d.body_entered.connect(recoguida)
	_iniciar_animacion()
	
func recoguida(_body):
	contenedor_monedas.moneda_recogida()
	reproductor.reparent(get_parent().get_parent().get_parent())#estamos colocalndo el reproductor como hijo del padfe de moneda
	reproductor.play()
	queue_free()
	
func _iniciar_animacion():
	var tween: Tween = create_tween()
	tween.set_loops(0)
	tween.tween_property(self, "position:y",position.y -5, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:y",position.y +5, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
