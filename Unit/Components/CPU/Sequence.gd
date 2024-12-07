extends Task

# All children must run successfully

class_name Sequence

var current_child = 0

func _init() -> void:
	block = preload("res://Tasks/Blocks/BlockStatement.tscn")
	name = "Sequence"
	
func run():
	running()
	await wait()
	children[current_child].run()

func child_success():
	current_child += 1
	if current_child >= children.size():
		current_child = 0
		success()
	else:
		await wait()
		children[current_child].run()


func child_fail():
	current_child = 0
	fail()

func cancel():
	current_child = 0
	super.cancel()

func start():
	current_child = 0
	super.start()
