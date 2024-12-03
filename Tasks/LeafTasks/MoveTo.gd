extends Task

class_name MoveTo

func _init() -> void:
	name = "Move To"
	inputs = {
		"position": {
			"type": Task.Data.POS,
			"value": null,
			"label": "Position"
		}
	}
	block = preload("res://Tasks/Blocks/BlockFunction.tscn")
	
func run():
	if status == FRESH:
		print(inputs)
		running()
	else:
		success()
	
	
