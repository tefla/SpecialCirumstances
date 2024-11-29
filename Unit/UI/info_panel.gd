extends Control
class_name InfoPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.selection_changed.connect(on_selection_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_selection_changed(units: Array[Node2D]):
	print(units)
	for child in %List.get_children():
		%List.remove_child(child)
	if units.size() > 0:
		# Attach Units Components to the Panel
		var unit = units[0]
		var panels = unit.generate_panels()
		for panel in panels:
			%List.add_child(panel)
		unit.populate_block_palette()
		
