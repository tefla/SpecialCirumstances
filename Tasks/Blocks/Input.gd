extends Container
class_name InputBlockBase

@export var drop_type: Task.Data
var _input: Dictionary
var _name: String

func set_input(input):
	_input = input
	$Name.text = input.label

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data is Task:
		return data.output.get_type() == drop_type
	return false
