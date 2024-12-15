extends Node

enum SelectionMode {
	NONE,SINGLE, AREA
}

enum PositionSelectionMode {
	NONE, POINT
}
signal position_selected(pos)

signal selection_mode_changed(mode: SelectionMode)
var selection_mode = SelectionMode.SINGLE
var position_selection_mode = PositionSelectionMode.NONE

var selected: Array = []

signal selection_changed(selected: Array)

func set_position(pos):
	position_selected.emit(pos)
	set_position_selection_mode(PositionSelectionMode.NONE)
func set_position_selection_mode(mode: PositionSelectionMode):
	
	position_selection_mode = mode	
func set_selection_mode(mode: SelectionMode):
	selection_mode = mode
	selection_mode_changed.emit(mode)
	
func set_selected(units: Array):
	
	for unit in selected:
		if unit is Unit:
			unit.selected = false
	selected = units	
	for unit in selected:
		if unit is Unit:
			unit.selected = true
	selection_changed.emit(selected)	
func deselect():
	selected = []
	selection_changed.emit(selected)
	
