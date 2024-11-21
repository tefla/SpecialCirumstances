extends PropertyEditor
class_name EntityTypePropEditor


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tree_toggled(toggled_on: bool) -> void:
	print("Tree Toggle")
	value_changed.emit("tree")


func _on_unit_pressed() -> void:
	value_changed.emit("unit")


func _on_hippy_pressed() -> void:
	value_changed.emit("hippy")
