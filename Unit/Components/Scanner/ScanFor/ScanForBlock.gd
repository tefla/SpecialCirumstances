@tool
extends BaseBlock
class_name ScanForBlock

@onready var options = $HBox/OptionButton
func _ready() -> void:
	options.item_selected.connect(set_scan_target)

func set_scan_target(idx):
	if idx == 0:
		_task.scan_for_type = "Tree"
	elif idx == 1:
		_task.scan_for_type = "Stick"
		
func set_task(task: Task):
	_task = task
	%Name.text = _task.name
	
		
func _process(delta: float) -> void:
	if _task:
		%Status.visible = _task.status == Task.RUNNING
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return  data is Task and data.result_type == Task.ResultType.POSITION
