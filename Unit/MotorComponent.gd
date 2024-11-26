extends Component
class_name MotorComponent


func _init() -> void:
	features = ComponentFeatures.BLOCK_PROVIDER

func get_blocks():
	return ["Move To"]
