extends Node2D
class_name Manipulator

@export var area: Area2D
@export var inventory: Inventory


func sort_nodes_by_distance(reference_point: Vector2, nodes: Array):
	nodes.sort_custom(func(a, b): 
		var dist_a = a.position.distance_to(reference_point)
		var dist_b = b.position.distance_to(reference_point)
		return dist_a < dist_b
	)


func pickup(type: String) -> bool:
	var pickable = scan(type)
	if pickable:
		if inventory.add_item(pickable.item, 0):
			pickable.destroy()
			return true
	# error
	return false
	
func scan(type: String) -> PickupableComponent:
	var areas = area.get_overlapping_areas()
	sort_nodes_by_distance(position, areas)
	for other_area in areas:
		if other_area is PickupableArea:
			var pa: PickupableArea = other_area
			if pa.pickable.item.type == "Stick":
				return pa.pickable
	return 
