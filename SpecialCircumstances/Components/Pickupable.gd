extends Node2D
class_name PickupableComponent

@export var item: Item
@export var root: Node

func destroy():
	root.queue_free()
