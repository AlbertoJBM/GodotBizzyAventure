extends Button
@export var escena_principal: PackedScene
func _ready() -> void:
	pressed.connect(jugar, 4)#el 4 es para desconectar el boton despues de inicializar
func jugar():
	get_tree().change_scene_to_packed(escena_principal)
	
