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
		var meta = body.get_meta("can_pick_up")
		if meta:
			var inv = entity.get_component(InventoryComponent)
			var item = InventoryComponent.InventoryItem.new()
			item.name = "Stick"
			inv.add_item(item)
			print(inv.items)
			#inv.add_item()
			print("Yo", body)
			body.queue_free()
			return
			
	
