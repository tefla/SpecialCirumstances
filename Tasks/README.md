# Tasks

Any action that can be performed in the game by the player is a task. Tasks are the building blocks of the game. Each element a player can drop into the script panel is a task provided by one of the Units components (movement comp, attack comp, scanner comp, etc).

## Task Data

Tasks need to be able to accept data as parameters when being run, and also return data when they are completed. This data is stored in the task object itself.

```gdscript
# The result of a completed task
enum TaskDataType {
    NULL,
    STRING,
    INT,
    POSITION, # Vect2
    AREA      # Rect2
}

# The data that the task will return
# Use a dictionary to deal with different data types
# Store the result in 'value' and the type in 'data_type'

extends Resource
class_name TaskData

var _data = {}

func set_data(value, data_type):
    _data["value"] = value
    _data["data_type"] = data_type

func get_data():
    return _data

func get_value():
    return _data["value"]

func get_data_type():
    return _data["data_type"]


```

## Task Definition

```gdscript
extends Resource
class_name Task


# States
enum {
	FRESH,
	RUNNING,
	FAILED,
	SUCCEEDED,
	CANCELLED
}

# The name of the task
var name: String = "Task"

# The children of the task
var children: Array = []

# The data that the task will return
var data: Dictionary = {}

# The type of data that the task will return
var data_type: TaskDataType = TaskDataType.NULL

# Input parameters for the task
var parameters: Dictionary = {}


# The UI element that represents a task
var ui: PackedScene = preload("res://Tasks/Task.tscn")

var control = null
var tree = null
# var guard = null
var status = FRESH

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
		for child in children:
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
	for child in children:
		child.control = self
		child.tree = self.tree
		child.start()

func reset():
	cancel()
	status = FRESH
```
