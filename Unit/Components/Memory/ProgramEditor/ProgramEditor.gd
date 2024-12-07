extends Container

var root: Task

func redraw():
	for child in get_children():
		child.queue_free()
	add_child(await root.get_block())


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	root = data
	redraw()
