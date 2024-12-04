extends Task
class_name PositionTask

var _value: Vector2 = Vector2.ZERO

func _init() -> void:
	name = "Position"
	block = preload("PositionBlock.tscn")
	result_type = ResultType.POSITION

func get_block():
	var _block = super.get_block()
	# Attach listeners
	return _block
func run():
	if status == FRESH:
		running()
		_value = Vector2(randi()%10,randi()%10)
	else:
		success()
