extends Control

@export var library: BlockLibrary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var blocks = library.blocks
	for block in blocks:
		var blockInstance = block.instantiate()
		%BlocksContainer.add_child(blockInstance)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
