extends Component
class_name ScannerComponent

func _init() -> void:
	features = ComponentFeatures.BLOCK_PROVIDER

func get_blocks():
	return ["Scan For Nearest", "Scan for Furthest"]
