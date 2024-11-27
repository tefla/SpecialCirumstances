@tool
extends Container

@export var call_add_child_block: bool = false : set = add_child_block



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_child_block(new_value: bool):
	print("Hi")
	pass
