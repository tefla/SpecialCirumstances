extends Node2D
class_name Entity

@export var components: Array[Component] = []

func get_component(componentType):
	for comp in components:
		if is_instance_of(comp, componentType):
			return comp
