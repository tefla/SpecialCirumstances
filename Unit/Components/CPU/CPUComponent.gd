extends Component
class_name CPUComponent

@export var CLOCK_SPEED = 2 / 1

func _init() -> void:
	features = ComponentFeatures.TASK_PROVIDER
	tasks = [Sequence.new(), Repeat.new()]

func tick():
	await get_tree().create_timer(CLOCK_SPEED).timeout
