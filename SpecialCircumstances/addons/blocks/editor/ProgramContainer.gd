extends VBoxContainer


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true


func _drop_data(at_position: Vector2, data: Variant) -> void:
	var clone = data.duplicate()
	add_child(clone)
	
