extends Node2D
class_name Task

enum ResultType {
	NONE,
	ANY,
	POSITION
}

var result_type: ResultType = ResultType.NONE
signal removed(task: Task)

@export var child_container: Container



# States
enum {
	FRESH,
	RUNNING,
	FAILED,
	SUCCEEDED,
	CANCELLED
}
var control = null
var tree = null
# var guard = null
var status = FRESH
var entity: Entity

func get_task_name():
	return name
	
# Final methods
func running():
	status = RUNNING
	if control != null:
		control.child_running()

func success():
	print("success", name)
	status = SUCCEEDED
	if control != null:
		control.child_success()

func fail():
	print("fail", name)
	status = FAILED
	if control != null:
		control.child_fail()

func cancel():
	print("cancel", name)
	if status == RUNNING:
		status = CANCELLED
		# Cancel child tasks
		for child in child_container.get_children():
			child.cancel()

# Abstract methods
func run():
	# Process the task and call running(), success(), or fail()
	pass

func child_success():
	success()

func child_fail():
	fail()

func child_running():
	running()


# Non-final non-abstact methods
func start():
	print("starting task", name)
	status = FRESH
	for child in child_container.get_children():
		child.control = self
		child.tree = self.tree
		child.entity = entity
		child.start()

func reset():
	cancel()
	status = FRESH


	
	
func wait() -> void:
	await entity.get_component(CPUComponent).tick()
