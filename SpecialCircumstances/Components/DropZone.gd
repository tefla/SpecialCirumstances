extends Control

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	print(data)
	return data is Task

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data is Task:
		add_child(data.duplicate())
