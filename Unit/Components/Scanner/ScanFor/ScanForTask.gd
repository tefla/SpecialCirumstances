extends Task
class_name ScanForTask

var _value: Vector2
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
	running()
	component.scanner.play("scanner")
	await wait()
	var res = component.scan_area()
	if res:
		_value = res.position
		component.scanner.stop()
		success()
	else:
		fail()
	
