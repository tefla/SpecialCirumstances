extends VBoxContainer
class_name MemoryUI
@onready var palette = %Palette
@onready var program_editor = %ProgramEditor
var entity: Entity

func _ready() -> void:
	print(program_editor.root)
	var root = ResourceLoader.load("user://tree.res")
	if root is Task:
		root.entity = entity
		program_editor.root = root
		program_editor.redraw()
	pass
func _on_step_pressed() -> void:

	program_editor.root.start()
	
	program_editor.root.run()


func _on_reset_pressed() -> void:
	program_editor.root.reset()

	var error = ResourceSaver.save(program_editor.root, "user://tree.res")
	if error != OK:
		printerr(error)
	
