@tool
extends Button
class_name PaletteItem

@export var task: Task

func _ready() -> void:
	text = task.name
func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(duplicate())
	return task
