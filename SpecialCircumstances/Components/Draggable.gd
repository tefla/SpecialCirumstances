extends Control

@export var root: Control

func _ready() -> void:
	root.set_drag_forwarding(get_drag_data, can_drop_data, drop_data)
	
func get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(root.duplicate())
	return root
func can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return false
	
func drop_data(at_position: Vector2, data: Variant) -> void:
	pass
