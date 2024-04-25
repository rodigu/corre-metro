extends Node2D

export var gravidade = 8500
export var forca_pulo = -1570

onready var controle_toque = $ToqueDeslize
onready var espremedor = $Espremedor
onready var animacoes = $SpriteJogador
onready var pular = $Pular

var pontos = 0

enum Estados {
	Correndo,
	Abaixado,
	Pulando
}
var estado = Estados.Correndo


func _on_ToqueDeslize_deslizar(direcao):
	if direcao == controle_toque.direcoes.baixo:
		espremedor.espremer(self)
		animacoes.animation = 'agir'
		estado = Estados.Abaixado
	elif direcao == controle_toque.direcoes.cima:
		animacoes.animation = 'agir'
		pular.pular(forca_pulo, self.position.y, gravidade)
		estado = Estados.Pulando


func _on_Espremedor_desespremido():
	animacoes.animation = 'correr'
	estado = Estados.Correndo


func _on_Pular_caiu():
	animacoes.animation = 'correr'
	estado = Estados.Correndo


func _on_Area2D_area_entered(area):
	if estado == Estados.Correndo:
		pontos = 0
	else:
		pontos += 1
	$Pontos/Pontos.text = str(pontos)
