extends PanelContainer
class_name Inventory

@export var slots_container: Container
@export var styleBox: StyleBoxTexture

func add_item(item: Item, slot_idx: int) -> bool:
	var slot: Slot = slots_container.get_child(slot_idx)
	if not slot.item or slot.item.type == item.type:
		slot.item = item
		slot.count += 1
		return true	
	return false
	
