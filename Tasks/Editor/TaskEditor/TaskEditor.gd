@tool
extends Container
class_name TaskEditor

@export var task: Task

func _ready() -> void:
	$Header/Name.text = task.name
	for prop in task.properties:
		var newPropEditor = prop.editor.instantiate()
		%Parameters.add_child(newPropEditor)
	if task.canHaveChildren:
		%Children.visible = true
	else:
		%Children.visible = false
