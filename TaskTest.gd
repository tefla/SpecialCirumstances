extends Node2D

@export var task: Task 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	task.tree = task
	var ui = task.get_block()
	$TaskList.add_child(ui)
	task.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if task.status not in [task.FAILED, task.CANCELLED, task.SUCCEEDED]:
	print(task.status)
	task.run()
	print(task.status)
