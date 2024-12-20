extends PanelContainer
class_name Status

@export var is_running: Control
@export var task: Task

func _ready() -> void:
	task.status_changed.connect(_on_task_status_changed)

func _on_task_status_changed(state: Task.State) -> void:
	if state == Task.State.RUNNING:
		is_running.visible = true
	else :
		is_running.visible = false
