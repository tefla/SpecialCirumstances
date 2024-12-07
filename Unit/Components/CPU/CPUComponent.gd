extends Component
class_name CPUComponent

func _init() -> void:
	features = ComponentFeatures.TASK_PROVIDER
	tasks = [Sequence.new()]
