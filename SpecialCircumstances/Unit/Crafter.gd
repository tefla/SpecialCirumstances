extends Node2D
class_name CrafterComponent

@export var inventory: UnitInventory

func craft():
	var item = inventory.slots_container.get_child(0)
	
	var new_item: Item = preload("res://Branches/RedBranch.tres")
	
	inventory.add_item(new_item, 0)
	return true
