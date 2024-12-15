extends Node2D
class_name Component

var entity: Entity :
	get: return get_parent().get_parent()


enum ComponentFeatures {
	NONE = 0,
	UI_PROVIDER = 1 << 0,
	TASK_PROVIDER = 1 << 1
}
var features: ComponentFeatures = ComponentFeatures.NONE
var tasks: Array[Task] = []

func get_ui():
	pass
	

func get_tasks() -> Array[Task]:
	return tasks

func use():
	pass
