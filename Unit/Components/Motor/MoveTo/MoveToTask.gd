extends Task
class_name MoveToTask

func add_child(task: Task):
	task.removed.connect(remove_child)

	children.clear()
	children.append(task)

func _init() -> void:
	name = "Move To:"
	block = preload("MoveToBlock.tscn")


func get_block():
	var _block = super.get_block()
	# Attach listeners
	return _block

func run():
	if status == FRESH:
		running()
	else:
		children[0].run()
func child_success():
	# Get value from child
	var child = children[0]
	print("Got Pos", child._value)
	success()
