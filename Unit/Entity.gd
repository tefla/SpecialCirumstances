extends Node2D
class_name Entity

@onready var components = $Components

func get_component(componentType):
	for comp in components.get_children():
		if is_instance_of(comp, componentType):
			return comp
