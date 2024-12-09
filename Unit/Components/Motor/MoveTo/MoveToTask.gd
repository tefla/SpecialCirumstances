extends Task
class_name MoveToTask

func add_child(task: Task):
	task.removed.connect(remove_child)

	children.clear()
	children.append(task)

func _init() -> void:
	name = "Move To:"
	block = preload("MoveToBlock.tscn")

func child_success():
	if status != RUNNING:
		return
	var target = children[0]._value
	var component = entity.get_component(MotorComponent)
	component.set_target(target)
	component.start()
	await component.navigation_agent.navigation_finished
	if component.navigation_agent.is_target_reached():
		success()
	else:
		fail()


func get_block():
	var _block =  super.get_block()
	# Attach listeners
	return _block

func run():
	if children.size() != 1:
		fail()
		return
	running()
	await wait()
	children[0].run()
