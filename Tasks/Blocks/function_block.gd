@tool
extends BaseBlock
class_name BlockFunction


func _enter_tree() -> void:
	print(_task.inputs)
func add_child_block():
	print("Can't add children to function blocks")
func set_task(task: Task):
	_task = task
	%Name.text = _task.name
	for inputKey in task.inputs:
		var input = task.inputs[inputKey]
		var ui = Task.InputBlocks[input["type"]].instantiate()
		ui.set_input(input)
		add_input(ui)
func add_input(input):
	%Inputs.add_child(input)
	

		
func _process(delta: float) -> void:
	if _task:
		%Status.visible = _task.status == Task.RUNNING
