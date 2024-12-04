@tool
extends Container

@export var tasks: Array[Task] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for task in tasks:
		var block = task.get_block()
		block.is_template = true
		add_child(block)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
