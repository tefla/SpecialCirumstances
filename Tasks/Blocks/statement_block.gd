@tool
extends BaseBlock
class_name StatementBlock



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_child_block(block: BaseBlock):
	%BlockChildren.add_child(block)

#func _get_drag_data(at_position: Vector2) -> Variant:
#	pass
	#print("Hi")
	#var data = {
		#"node": self
	#}
	#set_drag_preview(duplicate())
	#return data
func set_task(task: Task):
	_task = task
	for sub_task in _task.children:
		add_child_block(sub_task.get_block())
