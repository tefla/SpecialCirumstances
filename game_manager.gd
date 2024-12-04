extends Node

enum SelectionMode {
	NONE,SINGLE, AREA
}
signal selection_mode_changed(mode: SelectionMode)
var selection_mode = SelectionMode.NONE

var selected: Array[Node2D] = []

signal selection_changed(selected: Array[Node2D])

func set_selection_mode(mode: SelectionMode):
	selection_mode = mode
	selection_mode_changed.emit(mode)
	
func set_selected(units: Array[Node2D]):
	for unit in selected:
		unit.selected = false
	selected = units	
	for unit in selected:
		unit.selected = true
	selection_changed.emit(selected)	
func deselect():
	selected = []
	selection_changed.emit(selected)
	
