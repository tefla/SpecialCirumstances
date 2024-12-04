extends Task
class_name MoveToTask

var _value: Vector2 = Vector2.ZERO

func add_child(task: Task):
	children.clear()
	children.append(task)

func _init() -> void:
	name = "Move To:"
	block = preload("MoveToBlock.tscn")


func get_block():
	var _block = super.get_block()
	# Attach listeners
	return _block
