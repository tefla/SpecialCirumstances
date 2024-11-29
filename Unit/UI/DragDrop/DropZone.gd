extends Control

signal on_drop(data: Variant)

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	print(at_position)
	return true
func _drop_data(at_position: Vector2, data: Variant) -> void:
	print("Dropping in DropZone")
