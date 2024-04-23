class_name GeradorObjeto
## Copiado de [https://github.com/uheartbeast/Galaxy-Defiance/blob/main/components/spawner_component.gd]

extends Node


var objeto: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func gerar(local: Vector2, responsavel: Node) -> PackedScene:
	## Gera objeto no local dado, e da para o responsavel
	assert(objeto is PackedScene, 'Sem objeto para instanciar.')
	var novo_objeto = objeto.instance()
	responsavel.add_child(novo_objeto)
	novo_objeto.global_position = local
	return novo_objeto
