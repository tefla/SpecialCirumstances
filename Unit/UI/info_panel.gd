extends Control
class_name InfoPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.selection_changed.connect(on_selection_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_selection_changed(units: Array):
	for child in %List.get_children():
		%List.remove_child(child)
	if units.size() > 0:
			
		# Attach Units Components to the Panel
		var unit = units[0]
		if unit is not Unit:
			return 
		if unit.panel:
			var p: Control = unit.panel
			
			
			unit.panel.visible=true
		#var panels = unit.panel
		#for panel in panels:
		
		%List.add_child(unit.panel)
		#var memComp = unit.get_component(MemoryComponent)
		#
		#unit.populate_task_palette()
		
