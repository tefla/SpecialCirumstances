@tool
extends BaseBlock
class_name PositionBlock


func add_child_block():
	print("Can't add children to function blocks")

func set_task(task: Task):
	_task = task
	%Name.text = _task.name
	%Value.text = "%s" % [task._value]
	
func _process(delta: float) -> void:
	if _task:
		%Status.visible = _task.status == Task.RUNNING