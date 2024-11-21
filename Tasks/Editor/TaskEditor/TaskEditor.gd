@tool
extends Container
class_name TaskEditor

@export var task: Task

func _ready() -> void:
	$Header/Name.text = task.name
	for prop in task.properties:
		var newPropEditor = prop.create_editor()
		
		%Parameters.add_child(newPropEditor)
	if task.canHaveChildren:
		%Children.visible = true
	else:
		%Children.visible = false
	%Children.child_added.connect(_child_added_to_task)
	
func _child_added_to_task(_task: Task):
	task.children.append(_task)
