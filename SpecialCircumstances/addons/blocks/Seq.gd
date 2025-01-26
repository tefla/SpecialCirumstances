extends Task
class_name Sequence

var current_child = 0

func run():
	var children = child_container.get_children()
	running()
	children[current_child].run()

func child_success():
	var children = child_container.get_children()
	current_child += 1
	if current_child >= children.size():
		current_child = 0
		success()
	else:
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
