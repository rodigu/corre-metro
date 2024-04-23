class_name Fila
extends Node

var items = []

func _init():
	pass

func adicionar(item):
	items.append(item)

func retirar():
	return items.pop_front()

func ultimo_item():
	return items[-1]

func primeiro_item():
	return items[0]
