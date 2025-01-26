extends VBoxContainer

@export var root_task: Task


func _on_run_pressed() -> void:
	root_task.start()
	root_task.run()
