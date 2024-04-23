class_name Obstaculo
extends Node2D

export var tamanho_inicial: Vector2 = Vector2(1, 1)
export var velocidade_inicial: float = 1
export var aceleracao: float = 20
export var fator_crescimento = .005

var velocidade = velocidade_inicial

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	position.y += delta * velocidade
	var crescimento = velocidade * fator_crescimento * delta
	scale.x += crescimento
	scale.y += crescimento
	velocidade += aceleracao


func resetar(posicao: Vector2):
	velocidade = velocidade_inicial
	position = posicao
