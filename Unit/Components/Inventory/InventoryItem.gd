class_name InventoryItem extends Resource

@export var name: String
@export var icon: Texture2D
@export var quantity: int = 1

var ui: PackedScene = preload("ui/InventoryItem.tscn")


func get_ui():
	var instance: UIInventoryItem = ui.instantiate()
	var on_ready = func ():
		instance.countLabel.text = str(quantity)
		instance.container.texture = icon
	instance.ready.connect(on_ready)
	return instance
