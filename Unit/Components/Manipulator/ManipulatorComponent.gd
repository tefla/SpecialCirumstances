extends Component

func _init() -> void:
	features = ComponentFeatures.TASK_PROVIDER
	tasks = [PickUpTask.new()]


@onready var area = $Area2D
func scan_area():
	var areas = area.get_overlapping_areas()
	print("Found following areas", areas)
	var bodies: Array[Node2D] = area.get_overlapping_bodies()
	print("Found following bodies", bodies)
	var all_bodies = areas + bodies
	for body in all_bodies:
		if body.can_pick_up:
			print("Yo")
	return bodies.front()
	
