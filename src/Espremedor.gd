extends Node

export var tempo_espremido = 2
export var tempo_espremindo = .2
export var escala_espremida = Vector2(1, .5)

var escala_original: Vector2 = Vector2(1, 1)
var velocidade: Vector2 = Vector2(0, 0)
var tempo_passado: float = 0

# Estagios:
# - 0: espremindo
# - 1: espremido
# - 2: desespremindo
var estagio = 0
var espremido: Node2D = null


func _ready():
	pass


func _process(delta):
	if not espremido:
		return
	
	tempo_passado += delta

	if tempo_passado >= tempo_espremindo:
		estagio = 1
	elif tempo_passado >= tempo_espremido + tempo_espremido:
		estagio = 2
	else:
		estagio = 0
		espremido.scale = escala_original
		espremido = null

	if estagio == 0: espremido.scale += velocidade
	elif estagio == 1: espremido.scale = escala_espremida
	elif estagio == 2: espremido.scale -= velocidade


func espremer(nodulo: Node2D):
	espremido = nodulo
	estagio = 0
	escala_original = espremido.scale
	velocidade = (espremido.scale - escala_espremida) / tempo_espremindo
	tempo_passado = 0
