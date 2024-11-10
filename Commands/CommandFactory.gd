extends Resource
class_name CommandFactory

@export var editor_scene: Resource
@export var command_resource : Resource

var parent_component

var name = "Move"
func create(_unit):
	print(parent_component)
	var editor = editor_scene.instantiate()
	var instance = command_resource.new()
	instance.editor = editor
	instance.unit = _unit
	editor.command = instance
	instance.parent_component = parent_component
	return instance
