@tool
extends BaseBlock
class_name MoveToBlock



func set_task(task: Task):
	_task = task
	%Name.text = _task.name
	redraw()
func redraw():
	if _task.children.size() == 1:
		%Value.get_children().clear()
		%Value.add_child(_task.children[0].get_block())
	
		

	
	
func _process(delta: float) -> void:
	if _task:
		%Status.visible = _task.status == Task.RUNNING
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return  data is Task and data.result_type == Task.ResultType.POSITION
