extends Control
class_name ChildrenPanel

signal child_added(child: Task)

@onready var taskEditorScene = preload("TaskEditor.tscn")

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Task
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data is Task:
		var newTaskEditor = taskEditorScene.instantiate()
		var newTask = data.create()
		
		child_added.emit(newTask)
		newTaskEditor.task = newTask
		add_child(newTaskEditor)
