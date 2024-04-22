extends Node
class_name ToqueDeslize

export var distancia_minima = 50
# Explicitar as direcoes possiveis
# Tambem ajuda a usar o intellisense e evitar erros na escrita
export var direcoes = {
	cima = 'pular',
	baixo = 'abaixar',
	direita = 'mover-direita',
	esquerda = 'mover-esquerda'
}

signal deslizar(direcao)

func criar_toque(x: float, y: float, press: bool):
	return { pos = Vector2(x, y), pressionado = press }

onready var rastrea_toque = {
	anterior = criar_toque(0, 0, false),
	atual = criar_toque(0, 0, false),
}


func _ready():
	pass # Replace with function body.


func _unhandled_input(event):
	if !(event is InputEventScreenTouch):
		return

	rastrea_toque.anterior = rastrea_toque.atual
	var pos = event.position
	var press = event.pressed
	rastrea_toque.atual = criar_toque(pos.x, pos.y, press)

	if (not rastrea_toque.atual.pressionado) and (rastrea_toque.anterior.pressionado):
		lidar_deslize(rastrea_toque.anterior.pos, rastrea_toque.atual.pos)

func lidar_deslize(inicio: Vector2, fim: Vector2):
	var dist = inicio.distance_to(fim)

	if dist < distancia_minima:
		return

	var dif_y = fim.y - inicio.y

	if dif_y < 0:
		emit_signal('deslizar', direcoes.cima)
	else:
		emit_signal('deslizar', direcoes.baixo)
