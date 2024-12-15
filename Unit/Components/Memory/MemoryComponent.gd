extends Component
class_name MemoryComponent
var _ui: PackedScene = preload("MemoryUI.tscn")
var ui
func _init() -> void:
	features = ComponentFeatures.UI_PROVIDER
	ui = _ui.instantiate()
	_actor_wait.call_deferred()

func _actor_wait():
	await get_tree().process_frame
	
func get_ui() -> MemoryUI:
	ui.entity = entity
	return ui
