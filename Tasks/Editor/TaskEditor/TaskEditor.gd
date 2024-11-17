@tool
extends Container
class_name TaskEditor

@export var task: Task

func _ready() -> void:
	$Header/Name.text = task.name
	if task.canHaveChildren:
		%Children.visible = true
	else:
		%Children.visible = false
