extends Container
class_name Inventory

@onready var items = %Items

var entity: Entity

func _redraw():
	var inv: InventoryComponent = entity.get_component(InventoryComponent)
	
	for child in items.get_children():
		items.remove_child(child)
	
	for item: InventoryItem in inv.items:
		
		var ui = item.get_ui()
		items.add_child(ui)
