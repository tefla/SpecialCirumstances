@tool
extends Container

@export var tasks: Array[Task] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for task in tasks:
		var block = task.get_block()
		block.is_template = true
		add_child(block)
