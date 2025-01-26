extends Control

@export var blocks_container: BoxContainer


func _enter_tree() -> void:
	for child in blocks_container.get_children():
		set_block_picker_drag_forwarding(child)
		

func set_block_picker_drag_forwarding(child: Control):
	# Get drag data
	var get_drag_data = func get_drag_data(at_position: Vector2) -> Variant:
		child.set_drag_preview(child.duplicate())
		return child

	var can_drop_data = func can_drop_data(at_position: Vector2, data: Variant) -> bool: 
		return false

	var drop_data = func drop_data(at_position: Vector2, data: Variant) -> void:
		pass	
		
	child.set_drag_forwarding(get_drag_data, can_drop_data, drop_data)
