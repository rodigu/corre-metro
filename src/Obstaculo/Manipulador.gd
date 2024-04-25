class_name Manipulador
extends Node2D


onready var objetos = $Objetos
onready var gerador = $GeradorObjeto

var chance_gerar = .5
var fila_obstaculos: Array = []
var tamanho_maximo_fila = 5
var distancia_minima = 100
var frente_fila = 0
onready var posicao_inicial_obstaculos = Vector2(0, -get_viewport_rect().size.y * .7)

func _ready():
	for i in range(tamanho_maximo_fila):
		fila_obstaculos.append(gerador.gerar(posicao_inicial_obstaculos, objetos))
	fila_obstaculos[frente_fila].movendo = true

func mover_fila():
	fila_obstaculos[frente_fila].resetar(posicao_inicial_obstaculos)
	frente_fila += 1
	frente_fila %= tamanho_maximo_fila
	fila_obstaculos[frente_fila].movendo = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fila_obstaculos[frente_fila].position.y > get_viewport_rect().size.y:
		mover_fila()
