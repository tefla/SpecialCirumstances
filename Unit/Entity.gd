extends Node2D
class_name Entity

@export var components: Array[Component] = []

func get_component(componentType):
	for comp in components:
		if is_instance_of(comp, componentType):
			return comp

func populate_task_palette():
	var tasks = []
	for comp in components:
		if comp.features & Component.ComponentFeatures.TASK_PROVIDER:
			print("Generate TASK_PROVIDER for: %s" % [comp.get_class()])
			for task in comp.get_tasks():
				tasks.append(task)
	
	var memComp = get_component(MemoryComponent)
	var palette = memComp.get_ui().palette
	for child in palette.get_children():
		palette.remove_child(child)
	for task in tasks:
		var block = task.get_block()
		block.is_template = true
		palette.add_child(block)
	
