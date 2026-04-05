extends Button

func _ready() -> void:
	pressed.connect(get_parent().get_parent().get_parent().get_parent().get_parent()._reiniciar_nivel())
