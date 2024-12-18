extends Component
class_name MemoryComponent

@export var memoryUI: PackedScene

func _ready() -> void:
	#features = ComponentFeatures.UI_PROVIDER

	_actor_wait.call_deferred()

func _actor_wait():
	await get_tree().process_frame
	
