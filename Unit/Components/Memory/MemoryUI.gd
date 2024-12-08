extends VBoxContainer
class_name MemoryUI
@onready var palette = %Palette
@onready var program_editor = %ProgramEditor
func _ready() -> void:
	print(program_editor.root)
	var root = ResourceLoader.load("user://tree.res")
	if root is Task:
		program_editor.root = root
		program_editor.redraw()
	pass
func _on_step_pressed() -> void:
	%ProgramEditor.root.run()


func _on_reset_pressed() -> void:
	var error = ResourceSaver.save(program_editor.root, "user://tree.res")
	if error != OK:
		printerr(error)
		

	program_editor.root.start()
