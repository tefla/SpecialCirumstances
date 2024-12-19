extends VBoxContainer
class_name MemoryUI
@export var palette: BoxContainer

@export var program_editor: Container
var entity: Entity
signal is_ready

func _ready() -> void:
	#print(program_editor.root)
	#var root = ResourceLoader.load("user://tree.res")
	#if root is Task:
		#root.entity = entity
		#program_editor.root = root
		#program_editor.redraw()
	is_ready.emit()
	print(palette)

	_actor_wait.call_deferred()

func _actor_wait():
	await get_tree().process_frame
	#populate_task_palette()
	#var root = ResourceLoader.load("user://tree.res")
	#if root is Task:
		#root.entity = entity
		#program_editor.root = root
		#program_editor.redraw()

func _on_step_pressed() -> void:
	program_editor.root.entity = entity
	program_editor.root.start()
	
	program_editor.root.run()


func _on_reset_pressed() -> void:
	program_editor.root.reset()

	var error = ResourceSaver.save(program_editor.root, "user://tree.res")
	if error != OK:
		printerr(error)
	
func populate_task_palette():
	var tasks = []
	for comp in entity.components:
		comp.entity = entity
		if comp.features & Component.ComponentFeatures.TASK_PROVIDER:
			print("Generate TASK_PROVIDER for: %s" % [comp.get_class()])
			for task in comp.get_tasks():
				task.entity = entity
				tasks.append(task)
	
	if palette:
		for child in palette.get_children():
			palette.remove_child(child)
		for task in tasks:
			var block = await task.get_block()
			block.is_template = true
			palette.add_child(block)
	
