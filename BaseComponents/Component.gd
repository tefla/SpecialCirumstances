extends Node2D
class_name Component

var entity: Entity :
	get: return get_parent().get_parent()


enum ComponentFeatures {
	NONE = 0,
	UI_PROVIDER = 1 << 0,
	TASK_PROVIDER = 1 << 1
}
@export_flags("UI Provider", "Task Provider") 
var features = 0

@export var tasks: Array[Task] = []
func _ready():
	## Make sure to not await during _ready.
	actor_setup.call_deferred()

func actor_setup():
	## Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

func get_ui():
	pass
	
func initialise(): pass

func get_tasks() -> Array[Task]:
	return tasks

func use():
	pass
