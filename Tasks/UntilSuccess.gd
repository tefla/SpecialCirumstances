extends Task

# Only reports a success

class_name UntilSuccess
func _init() -> void:
	block = preload("Blocks/BlockStatement.tscn")
	name = "UntilSuccess"
	canHaveChildren = true

func run():
	children[0].run()
	running()

func child_success():
	success()

# Ignore child failure
func child_fail():
	pass
