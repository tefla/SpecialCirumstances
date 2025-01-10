extends Node
class_name Inventory

@export var label: Label

var contents: Array = []

func add_item(item: Item, slot_idx: int):
	contents.push_back(item)
	label.text = str(contents.size())
			
