class_name Manipulador
extends Node2D


onready var objetos = $Objetos
onready var gerador = $GeradorObjeto

var fila_obstaculos: Array = []
var tamanho_maximo_fila = 5

func _ready():
	var posicao_inicial_obstaculos = Vector2(0, 0)
	for i in range(tamanho_maximo_fila):
		fila_obstaculos.append(gerador.gerar())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		gerador.gerar(position, objetos)
