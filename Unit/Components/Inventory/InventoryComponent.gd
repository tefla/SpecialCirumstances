extends Component

class_name InventoryComponent

signal item_added(item: InventoryItem)

@onready var ui = preload("ui/Inventory.tscn").instantiate()

func _init() -> void:
	features = ComponentFeatures.UI_PROVIDER

func get_ui():
	ui.entity = entity
	return ui


var items: Array[InventoryItem]  = [
	
]
var max_slots = 3

func initialise():
	pass
	
func default_items():
	var item = preload("res://Items/Lazer/LazerInvItem.tres")
	add_item(item)
func add_item(item: InventoryItem) -> bool:
	# Check if item already exists in inventory
	for existing_item in items:
		if existing_item.name == item.name:
			# Increase the quantity of the existing item
			existing_item.quantity += item.quantity
			ui._redraw()
			return true

	# If item not found and we have space, add a new item
	if items.size() < max_slots:
		items.append(item.duplicate())
		ui._redraw()
		return true

	# If no space is available, return false
	return false
func remove_item(item_name: String, quantity: int = 1) -> bool:
	# Iterate through items to find the one to remove
	for i in range(items.size()):
		if items[i].name == item_name:
			# Reduce the quantity or remove completely if quantity drops to 0
			items[i].quantity -= quantity
			if items[i].quantity <= 0:
				items.remove_at(i)
			return true
	return false
func get_item_quantity(item_name: String) -> int:
	for it in items:
		if it.name == item_name:
			return it.quantity
	return 0

func has_item(item_name: String, min_quantity: int = 1) -> bool:
	return get_item_quantity(item_name) >= min_quantity
