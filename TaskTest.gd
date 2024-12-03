extends Node2D

@export var task: Task 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	task = MoveTo.new()
	task.tree = task
	var ui = task.get_block()
	%TaskList.add_child(ui)
	task.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if task.status not in [task.FAILED, task.CANCELLED, task.SUCCEEDED]:
	pass


func _on_step_pressed() -> void:
	task.run()


func _on_reset_pressed() -> void:
	task.start() # Replace with function body.
