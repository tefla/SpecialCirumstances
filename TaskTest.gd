@tool
extends Node2D

@export var task_list: Array[Task] = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for task in task_list:
		var ui = task.get_block()
		$TaskList.add_child(ui)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
