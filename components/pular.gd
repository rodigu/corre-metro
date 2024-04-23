class_name Pular
extends Node


onready var objeto = get_parent()

var gravidade = 0
var forca_pulo = 0
var piso_pulo = 0
var pulando = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not pulando: return
	
	forca_pulo += gravidade * delta
	objeto.position.y += forca_pulo * delta
	
	if objeto.position.y >= piso_pulo:
		pulando = false
		objeto.position.y = piso_pulo


## Inicia pulo
func pular(forca: float, piso: float, g: float) -> void:
	forca_pulo = forca
	piso_pulo = piso
	pulando = true
	gravidade = g
