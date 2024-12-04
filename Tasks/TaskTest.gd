extends Node2D

@export var task: Task 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	task.tree = task
	var ui = task.get_block()
	%TaskList.add_child(ui)
	task.start()
	

func _on_step_pressed() -> void:
	task.run()


func _on_reset_pressed() -> void:
	task.start() # Replace with function body.
