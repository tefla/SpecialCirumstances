extends Component
class_name MemoryComponent

func _ready() -> void:
	#features = ComponentFeatures.UI_PROVIDER

	_actor_wait.call_deferred()

func _actor_wait():
	await get_tree().process_frame
	
