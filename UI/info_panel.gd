extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.selection_changed.connect(on_selection_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_selection_changed(unit):
	if unit:
		for panel in unit.generate_panel():
			
			%List.add_child(panel)
