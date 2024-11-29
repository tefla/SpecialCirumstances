@tool
extends BaseBlock
class_name BlockFunction


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_child_block():
	print("Can't add children to function blocks")

func set_task(task: Task):
	_task = task
	%Name.text = _task.name
