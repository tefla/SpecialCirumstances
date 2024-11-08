extends Node

var selected: Player

signal selection_changed(selected: Player)


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
