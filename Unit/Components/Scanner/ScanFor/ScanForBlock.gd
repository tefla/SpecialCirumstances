@tool
extends BaseBlock
class_name ScanForBlock

@onready var options = $HBox/OptionButton
func _ready() -> void:
	for t in ScannableComponent.Type:
		options.add_item(t, ScannableComponent.Type[t])
		print(t, ScannableComponent.Type[t])
	# Get all the scannables 
	options.item_selected.connect(set_scan_target)
	if _task is ScanForTask:
		options.selected = _task.scan_for_type
func set_scan_target(idx):
	_task.scan_for_type = idx
		
func set_task(task: Task):
	_task = task
	%Name.text = _task.name
	
		
func _process(delta: float) -> void:
	if _task:
		%Status.visible = _task.status == Task.RUNNING
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return  data is Task and data.result_type == Task.ResultType.POSITION
