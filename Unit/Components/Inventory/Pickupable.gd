extends Component
class_name Pickupable


@export var invItem: InventoryItem
@export var root_node: Node

var can_pick_up = true

func handle_pickup(other_entity: Entity):
	pass
	# Do we have an Inventory
	var inv: InventoryComponent = other_entity.get_component(InventoryComponent)
	if not inv:
		print("Ohhh no")
		return 
	inv.add_item(invItem)
	root_node.queue_free()
	
