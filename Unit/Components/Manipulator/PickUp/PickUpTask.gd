extends Task
class_name PickUpTask

func _init() -> void:
	name = "Position"
	block = preload("res://Tasks/Blocks/BlockFunction.tscn")
	result_type = ResultType.NONE

func run():
	running()
	await wait()
	
	success()
