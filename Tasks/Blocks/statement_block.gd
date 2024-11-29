@tool
extends BaseBlock
class_name StatementBlock


func add_child_block(block: BaseBlock):
	%BlockChildren.add_child(block)

func set_task(task: Task):
	_task = task
	%Name.text = _task.name
	for sub_task in _task.children:
		add_child_block(sub_task.get_block())

func _process(delta: float) -> void:
	%Status.visible = _task.status == Task.RUNNING
