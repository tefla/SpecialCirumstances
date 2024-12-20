extends Task
class_name PickUpTask

func _init() -> void:
	name = "Pick Up"
	block = preload("res://Tasks/Blocks/BlockFunction.tscn")
	result_type = ResultType.NONE

func run():
	running()
	await wait()
	entity.get_component(ManipulatorComponent).scan_area()
	
	success()
