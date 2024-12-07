extends Task
class_name ScanForTask

func add_child(task: Task):
	task.removed.connect(remove_child)

	children.clear()
	children.append(task)

func _init() -> void:
	name = "Scan For: Tree"
	block = preload("ScanForBlock.tscn")
	result_type = ResultType.POSITION

func get_block():
	var _block = await super.get_block()
	# Attach listeners
	return _block

func run():
	if status == FRESH:
		running()
	else:
		success()
