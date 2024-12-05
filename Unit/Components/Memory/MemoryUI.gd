extends VBoxContainer
class_name MemoryUI
@onready var palette = %Palette

func _ready() -> void:
	pass
func _on_step_pressed() -> void:
	%ProgramEditor.root.run()


func _on_reset_pressed() -> void:
	%ProgramEditor.root.start()
