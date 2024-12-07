extends VBoxContainer
class_name MemoryUI
@onready var palette = %Palette
@onready var program_editor = %ProgramEditor
func _ready() -> void:
	pass
func _on_step_pressed() -> void:
	%ProgramEditor.root.run()


func _on_reset_pressed() -> void:
	print(program_editor.root.component.entity)
	program_editor.root.start()
