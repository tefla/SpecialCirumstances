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
		
		#var panels = unit.panel
		#for panel in panels:
		
		
		var memComp: MemoryComponent = unit.get_component(MemoryComponent)
		if memComp:
			var inst = memComp.memoryUI.instantiate()
			%List.add_child(inst)
		#
		#unit.populate_task_palette()
		
