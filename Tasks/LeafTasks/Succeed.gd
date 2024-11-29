extends StructureTask

class_name Succeed

func _init() -> void:
	name = "Succeed"
func run():
	if status == FRESH:
		running()
	else:
		success()
	
	
