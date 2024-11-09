extends Node

var selected: Unit

signal selection_changed(selected: Unit)


func set_selected(unit):
	selected = unit	
	selection_changed.emit(selected)	
func deselect():
	selected = null
	selection_changed.emit(selected)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Hi")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
