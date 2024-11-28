@tool
extends BaseBlock
class_name FunctionBlock


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_child_block():
	print("Can't add children to function blocks")

func _get_drag_data(at_position: Vector2) -> Variant:
	print("Hi?")
	var data = {
		"node": self
	}
	set_drag_preview(duplicate())
	return data
