extends Component
class_name ScannerComponent

func _init() -> void:
	features = ComponentFeatures.TASK_PROVIDER
	tasks = [ScanForTask.new()]
