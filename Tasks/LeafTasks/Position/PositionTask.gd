extends Task
class_name PositionTask

var _value: Vector2 = Vector2.ZERO

func _init(v: Vector2) -> void:
	name = "Position"
	block = preload("PositionBlock.tscn")
	result_type = ResultType.POSITION
	_value = v
func get_block():
	var _block = super.get_block()
	# Attach listeners
	return _block
func run():
	success()
