extends Container
class_name DataBlock

@export var data: DataTask

func _enter_tree() -> void:
	%Name.text = data.get_task_name()
func _get_drag_data(at_position: Vector2) -> Variant:
	# Duplicate ourselves for preview
	var preview = duplicate()
	set_drag_preview(preview)
	# Return the task
	return data
