extends Component
class_name MotorComponent


func _init() -> void:
	features = ComponentFeatures.TASK_PROVIDER
	tasks = [MoveToTask.new()]
