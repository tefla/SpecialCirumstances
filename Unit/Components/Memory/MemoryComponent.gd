extends Component
class_name MemoryComponent

@export var memoryUI: CanvasLayer
@export var unit: Unit

func _ready() -> void:
	#features = ComponentFeatures.UI_PROVIDER

	_actor_wait.call_deferred()
	memoryUI.visible = false
	GameManager.selection_changed.connect(on_selection_changed)
func on_selection_changed(units: Array):
	if units.size() > 0:
			
		# Attach Units Components to the Panel
		var _unit = units[0]

		if unit == _unit:
			memoryUI.visible = true
func _actor_wait():
	await get_tree().process_frame
	
