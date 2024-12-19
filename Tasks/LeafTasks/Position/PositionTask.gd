extends Task
class_name PositionTask

var _value: Vector2 = Vector2.ZERO

func _init(v: Vector2) -> void:
	name = "Position"
	result_type = ResultType.POSITION
	_value = v

func run():
	success()
