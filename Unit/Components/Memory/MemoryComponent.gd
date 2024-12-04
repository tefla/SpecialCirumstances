extends Component
class_name MemoryComponent
var _ui: PackedScene = preload("MemoryUI.tscn")
var ui
func _init() -> void:
	features = ComponentFeatures.UI_PROVIDER
	ui = _ui.instantiate()
	
func get_ui() -> MemoryUI:
	return ui
