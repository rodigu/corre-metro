extends Node2D

export var gravidade = 8500
export var forca_pulo = -1570

onready var controle_toque = $ToqueDeslize
onready var espremedor = $Espremedor
onready var animacoes = $SpriteJogador
onready var pular = $Pular

var Estados = {
	Correndo = 'correndo',
	Abaixado = 'abaixado',
	Pulando = 'pulando'
}
var estado = Estados.Correndo



func _on_ToqueDeslize_deslizar(direcao):
	if direcao == controle_toque.direcoes.baixo:
		espremedor.espremer(self)
		animacoes.animation = 'agir'
		estado = Estados.Abaixado
	elif direcao == controle_toque.direcoes.cima:
		pular.pular(forca_pulo, self.position.y, gravidade)
		estado = Estados.Pulando


func _on_Espremedor_desespremido():
		animacoes.animation = 'correr'