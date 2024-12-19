@tool
extends BaseBlock
class_name MoveToBlock

@export var display_name: String

func _ready() -> void:
	%Name.text = display_name

func set_task(task: Task):
	_task = task
	%Name.text = _task.name
	redraw()
func redraw():
	for child in %Value.get_children():
		%Value.remove_child(child)
	if _task.children.size() >0:
		%Value.add_child(await _task.children[0].get_block())
	
		
func _process(delta: float) -> void:
	if _task:
		%Status.visible = _task.status == Task.RUNNING
	
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return  data is Task and data.result_type == Task.ResultType.POSITION


func _on_button_pressed() -> void:
	# Tell the game manager to set the selection mode to Point
	GameManager.set_position_selection_mode(GameManager.PositionSelectionMode.POINT)
	var res = await GameManager.position_selected
	# We can just add the Pos as a task
	var pos = PositionTask.new(res)
	_task.add_child(pos)
	redraw()
