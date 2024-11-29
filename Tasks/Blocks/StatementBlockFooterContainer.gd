extends PanelContainer

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	print(data)
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	# If we drop a task on a function, add it as a sibling
	var block = data.get_block()
	get_parent().add_sibling(block)
