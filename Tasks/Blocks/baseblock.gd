extends Container
class_name BaseBlock

var _task: Task

func set_task(task: Task):
	print("Shoun't be called")
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _get_drag_data(at_position: Vector2) -> Variant:
	# Duplicate ourselves for preview
	var preview = duplicate(DUPLICATE_USE_INSTANTIATION & DUPLICATE_SCRIPTS)
	set_drag_preview(preview)
	queue_free()
	# Return the task
	return _task

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	# If we drop a task on a function, add it as a sibling
	var block = data.get_block()
	add_sibling(block)
