extends Tree


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = create_item()
	root.set_text(0, "Root")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
