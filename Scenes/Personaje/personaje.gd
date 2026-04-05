extends CharacterBody2D

signal personaje_muerto

@export var animacion: AnimatedSprite2D
@export var area2d: Area2D
@export var material_personaje_rojo: ShaderMaterial
var _velocidad: float = 100.0
var _velocidad_de_salto: float = -300.0
var _muerto: bool


func _ready() -> void:
	add_to_group("personajes")
	area2d.body_entered.connect(_on_area_2d_body_entered)

func _physics_process(delta: float) -> void:
	#para no movernos si nos morimos
	if _muerto:
		return
#movimiento vertical
	velocity += get_gravity() * delta
#salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():#ui aceept toma la barra espaciadora
		velocity.y = _velocidad_de_salto
		
		
#movimiento horizontal
	if Input.is_action_pressed("ui_right"):
		velocity.x = _velocidad
		animacion.flip_h =false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -_velocidad
		animacion.flip_h = true
	else:
		velocity.x = 0
#Animator
	if !is_on_floor():
		# Solo dispara la animación si NO es la de Saltar actualmente
		if animacion.animation != "Saltar":
			animacion.play("Saltar")
		
	elif velocity.x !=0:
		animacion.play("Correr")
	else:
		animacion.play("Idle")
		
	move_and_slide()
func _on_area_2d_body_entered(_body: Node2D) -> void:
	animacion.material = material_personaje_rojo
	_muerto = true
	animacion.stop()
	
	await get_tree().create_timer(0.5).timeout	
	ControladorGlobal._sumarMuerte()
	personaje_muerto.emit()
	
	print("muerto")
	
