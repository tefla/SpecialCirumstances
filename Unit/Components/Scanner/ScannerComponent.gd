extends Component
class_name ScannerComponent

@onready var area = $Area2D
@onready var scanner = $AnimationPlayer
func _init() -> void:
	features = ComponentFeatures.TASK_PROVIDER
	tasks = [ScanForTask.new()]

func scan_area(type):
	print("Scan for:", type)
	var areas = area.get_overlapping_areas()
	print("Found following areas", areas)
	var bodies: Array[Node2D] = area.get_overlapping_bodies()
	print("Found following bodies", bodies)
	var all_bodies = areas + bodies
	for body in all_bodies:
		var meta = body.get_meta("type")
		if meta == type:
			return body
	#return bodies.front()
	
