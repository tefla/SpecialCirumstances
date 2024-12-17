extends Component
class_name MemoryComponent
@export var memory_ui: PackedScene = preload("MemoryUI.tscn")
var _ui: MemoryUI
func _ready() -> void:
	#features = ComponentFeatures.UI_PROVIDER
	_ui = memory_ui.instantiate()
	_actor_wait.call_deferred()

func _actor_wait():
	await get_tree().process_frame
	
func get_ui() -> MemoryUI:
	_ui.entity = entity
	return _ui
