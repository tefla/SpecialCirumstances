extends Component
class_name ScannerComponent

@onready var area = $Area2D
@onready var scanner = $AnimationPlayer
#func _init() -> void:
	#features = ComponentFeatures.TASK_PROVIDER
	#tasks = [ScanForTask.new()]
func sort_nodes_by_distance(reference_point: Vector2, nodes: Array):
	nodes.sort_custom(func(a, b): 
		var dist_a = a.position.distance_to(reference_point)
		var dist_b = b.position.distance_to(reference_point)
		return dist_a < dist_b
	)
	return nodes

func scan_area(type: ScannableComponent.Type):
	print("Scan for:", type)
	var areas = area.get_overlapping_areas()
	print("Found following areas", areas)
	var bodies: Array[Node2D] = area.get_overlapping_bodies()
	print("Found following bodies", bodies)
	var all_bodies = areas + bodies
	sort_nodes_by_distance(entity.position, all_bodies)
	for body in all_bodies:
		if body is Entity:
			var scannable: ScannableComponent = body.get_component(ScannableComponent)
			if scannable:
				# get the type
				if scannable.type == type:
					return body
	
