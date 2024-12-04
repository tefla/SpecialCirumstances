extends Container
class_name BaseBlock

var is_template = false
var _task: Task 
func set_task(task: Task):
	print("Shoun't be called")
	

func _get_drag_data(at_position: Vector2) -> Variant:
	# Duplicate ourselves for preview
	var preview = duplicate(DUPLICATE_USE_INSTANTIATION & DUPLICATE_SCRIPTS)
	set_drag_preview(preview)
	if not is_template:
		queue_free()
	# Return the task
	return _task

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Task

func _drop_data(at_position: Vector2, data: Variant) -> void:
	# If we drop a task on a function, add it as a sibling
	var block = data.get_block()
	add_sibling(block)
