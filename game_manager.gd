extends Node

enum SelectionMode {
	NONE,SINGLE, AREA
}
signal selection_mode_changed(mode: SelectionMode)
var selection_mode = SelectionMode.NONE

var selected: Array[Unit] = []

signal selection_changed(selected: Array[Unit])

func set_selection_mode(mode: SelectionMode):
	selection_mode = mode
	selection_mode_changed.emit(mode)
	
func set_selected(units: Array[Unit]):
	for unit in selected:
		unit.deselect()
	selected = units	
	for unit in selected:
		unit.select()
	selection_changed.emit(selected)	
func deselect():
	selected = []
	selection_changed.emit(selected)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
