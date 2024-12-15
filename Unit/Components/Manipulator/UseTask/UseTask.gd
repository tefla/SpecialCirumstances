extends Task
class_name UseTask

# Using the currently selected Inventory item, perform the use action on the item
# For now, just make it the Punch task!


func _init() -> void:
	name = "Use Selected Item"
	block = preload("res://Tasks/Blocks/BlockFunction.tscn")
	result_type = ResultType.NONE

func run():
	running()
	await wait()
	var comp: ManipulatorComponent = entity.get_component(ManipulatorComponent)
	await comp.chop_area()
	
	success()
