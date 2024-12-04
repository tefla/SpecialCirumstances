@tool
extends BaseBlock
class_name MoveToBlock



func set_task(task: Task):
	_task = task
	%Name.text = _task.name

	
func _process(delta: float) -> void:
	if _task:
		%Status.visible = _task.status == Task.RUNNING
func _drop_data(at_position: Vector2, data: Variant) -> void:
	# If we drop a task on a function, add it as a sibling
	_task.children.clear()
	_task.add_child(data)
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is Task:
		return data.result_type == Task.ResultType.POSITION
	return false
