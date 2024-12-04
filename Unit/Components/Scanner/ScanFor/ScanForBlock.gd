@tool
extends BaseBlock
class_name ScanForBlock



func set_task(task: Task):
	_task = task
	%Name.text = _task.name
	
		
func _process(delta: float) -> void:
	if _task:
		%Status.visible = _task.status == Task.RUNNING
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return  data is Task and data.result_type == Task.ResultType.POSITION
