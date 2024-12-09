extends BaseBlock
class_name RepeatBlock

@onready var repeat_option: OptionButton = %RepeatOption

func _ready() -> void:
	repeat_option.item_selected.connect(set_repeat_option)
	repeat_option.selected = _task.LIMIT
func set_repeat_option(idx):
	_task.LIMIT = idx
func add_children_tasks(tasks: Array[Task]):
	for child in %BlockChildren.get_children():
		child.queue_free()
	for sub_task in tasks:
		%BlockChildren.add_child(sub_task.get_block())

func set_task(task: Task):
	super.set_task(task)
	%Name.text = _task.name
	add_children_tasks(_task.children)

func redraw():
	add_children_tasks(_task.children)

func _process(delta: float) -> void:
	if _task and not is_template:
		%Status.visible = _task.status == Task.RUNNING
