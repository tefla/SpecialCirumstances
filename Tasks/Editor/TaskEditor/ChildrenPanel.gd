extends Control
class_name ChildrenPanel

@onready var taskEditorScene = preload("TaskEditor.tscn")

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Task
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data is Task:
		var newTaskEditor = taskEditorScene.instantiate()
		newTaskEditor.task = data.duplicate()
		add_child(newTaskEditor)
