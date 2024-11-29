@tool
extends BaseBlock
class_name StatementBlock


func add_child_block(block: BaseBlock):
	%BlockChildren.add_child(block)

func set_task(task: Task):
	_task = task
	for sub_task in _task.children:
		add_child_block(sub_task.get_block())
