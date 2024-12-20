extends Node2D
class_name Scanner

@export var area: Area2D

	
func sort_nodes_by_distance(reference_point: Vector2, nodes: Array):
	nodes.sort_custom(func(a, b): 
		var dist_a = a.position.distance_to(reference_point)
		var dist_b = b.position.distance_to(reference_point)
		return dist_a < dist_b
	)

	
func scan(type: String):
	var areas = area.get_overlapping_areas()
	sort_nodes_by_distance(position, areas)
	for area in areas:
		if area is ScannableArea and area.type == type:
			
			return area.root.position
	
