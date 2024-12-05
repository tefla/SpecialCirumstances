extends Container
class_name BaseBlock


var is_template = false
var _task: Task 

signal task_dropped(data: Task)

func set_task(task: Task):
	_task = task
	#for child in get_children():
		#child.queue_free()

func redraw():
	pass
func _get_drag_data(at_position: Vector2) -> Variant:
	# Duplicate ourselves for preview
	var preview = duplicate(DUPLICATE_USE_INSTANTIATION & DUPLICATE_SCRIPTS)
	set_drag_preview(preview)
	if not is_template:
		_task.removed.emit(_task)
		queue_free()
	# Return the task
		return _task
	else:
		var newTask = _task.duplicate()
		newTask.component = _task.component
		return newTask

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return not is_template and data is Task

func _drop_data(at_position: Vector2, data: Variant) -> void:
	task_dropped.emit(data)
	redraw()
# If we drop a task on a function, add it as a sibling
	#var block = data.get_block()
	#add_sibling(block)
