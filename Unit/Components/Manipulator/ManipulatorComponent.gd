extends Component

@onready var area = $Area2D
func scan_area():
	var areas = area.get_overlapping_areas()
	print("Found following areas", areas)
	var bodies: Array[Node2D] = area.get_overlapping_bodies()
	print("Found following bodies", bodies)
	
	return bodies.front()
	
