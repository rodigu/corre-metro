extends Node

export var tempo_espremido = .8
export var tempo_espremindo = .1
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

signal desespremido


func _ready():
	pass


func _process(delta):
	if espremido == null:
		return

	tempo_passado += delta

	if tempo_passado >= tempo_espremido + tempo_espremindo * 2:
		espremido.scale.x = escala_original.x
		espremido.scale.y = escala_original.y
		espremido = null
		emit_signal("desespremido")
		return
	elif tempo_passado >= tempo_espremido + tempo_espremindo:
		estagio = 2
	elif tempo_passado >= tempo_espremindo:
		estagio = 1

	if estagio == 0: espremido.scale += velocidade * delta
	elif estagio == 1: espremido.scale = escala_espremida
	elif estagio == 2: espremido.scale -= velocidade * delta


func espremer(nodulo: Node2D):
	espremido = nodulo
	estagio = 0
	escala_original = espremido.scale
	velocidade = (escala_espremida - espremido.scale) / tempo_espremindo
	tempo_passado = 0
