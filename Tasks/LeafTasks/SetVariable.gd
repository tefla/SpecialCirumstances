extends Task

class_name SetVariable

func _init() -> void:
	name = "Succeed"
	properties.variable = "a"
	
func run():
	if status == FRESH:
		running()
	else:
		success()
	
	
