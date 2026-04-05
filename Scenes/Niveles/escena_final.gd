extends Node2D

func _ready() -> void:
	mutear_musica()

func mutear_musica():
	var bus_index = AudioServer.get_bus_index("Musica")
	AudioServer.set_bus_mute(bus_index, true)
