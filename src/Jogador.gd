extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var controle_toque = $ToqueDeslize
onready var espremedor = $Espremedor
onready var animacoes = $SpriteJogador

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ToqueDeslize_deslizar(direcao):
	if direcao == controle_toque.direcoes.baixo:
		espremedor.espremer(self)
		animacoes.animation = 'agir'
	elif direcao == controle_toque.direcoes.cima:
		pass


func _on_Espremedor_desespremido():
		animacoes.animation = 'correr'
