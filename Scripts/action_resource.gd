extends Resource
class_name ActionResource

@export var name = "Default Action Resource"
@export var action_ui: Resource
@export var action_script: Resource

func create():
	var inst = action_script.new()
	inst.instance_ui = action_ui.instantiate()
	return inst
	
	
