extends OptionButton

@export var task: ScanForTask


func _on_item_selected(index: int) -> void:
	task.scan_for_type = get_item_text(index)
	
