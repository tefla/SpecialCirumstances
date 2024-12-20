@tool
extends Control
class_name Task


@export var child_container: BoxContainer


# States
enum State {
	FRESH,
	RUNNING,
	FAILED,
	SUCCEEDED,
	CANCELLED
}
var control = null
var tree = null
signal status_changed(state)
# var guard = null
var status: State = State.FRESH :
	get : return status
	set (x): 
		status = x
		status_changed.emit(status)
	 
func _ready() -> void:
	get_parent().set_editable_instance(self, true)
# Final methods
func running():
	status = State.RUNNING
	if control != null:
		control.child_running()

func success():
	print("success", name)
	status = State.SUCCEEDED
	if control != null:
		control.child_success()

func fail():
	print("fail", name)
	status = State.FAILED
	if control != null:
		control.child_fail()

func cancel():
	print("cancel", name)
	if status == State.RUNNING:
		status = State.CANCELLED
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
	status = State.FRESH
	for child in child_container.get_children():
		child.control = self
		child.tree = self.tree
		child.start()

func reset():
	cancel()
	status = State.FRESH
