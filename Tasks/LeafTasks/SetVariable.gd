extends Task

class_name SetVariable

func _init() -> void:
	name = "Succeed"
	inputs = {
		"var": {
			"type": Task.Data.STRING,
			"value": null
		}
	}
	
func run():
	if status == FRESH:
		running()
	else:
		success()
	
	
