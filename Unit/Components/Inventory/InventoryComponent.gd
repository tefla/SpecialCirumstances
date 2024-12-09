extends Component

class_name InventoryComponent

signal item_added(item: InventoryItem)

# InventoryItem
class InventoryItem:
	var name: String
	var description: String
	var quantity: int
	var type: String
 

var items: Array[InventoryItem] = []

func _init() -> void:
	features = ComponentFeatures.UI_PROVIDER

func get_ui():
	var ui = preload("Inventory.tscn").instantiate()
	ui.entity = entity
	return ui
func add_item(item: InventoryItem) -> void:
	items.append(item)
	item_added.emit(item)


func remove_item(item: InventoryItem) -> void:
	items.erase(items.find(item))

func get_items() -> Array[InventoryItem]:
	return items

func get_item_by_name(name: String) -> InventoryItem:
	for item in items:
		if item.name == name:
			return item
	return null

func get_item_by_type(type: String) -> InventoryItem:
	for item in items:
		if item.type == type:
			return item
	return null

func get_item_by_index(index: int) -> InventoryItem:
	return items[index]

func get_item_count() -> int:
	return items.size()

func has_item(item: InventoryItem) -> bool:
	return items.has(item)

func has_item_by_name(name: String) -> bool:
	for item in items:
		if item.name == name:
			return true
	return false

func has_item_by_type(type: String) -> bool:
	for item in items:
		if item.type == type:
			return true
	return false
