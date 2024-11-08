extends PanelContainer

var unit: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	GameManager.selection_changed.connect(_on_selection_changed)
	
func _on_selection_changed(_unit: Player):
	if unit:
		unit.cpu.instruction_updated.disconnect(_on_cpu_instructions_changed)
	unit = _unit
	if unit:
		unit.cpu.instruction_updated.connect(_on_cpu_instructions_changed)
		_show_selected_unit_info()
		visible = true
	else:
		visible = false
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _show_selected_unit_info():
	
	for child in %ActionDefs.get_children():
		child.queue_free()

	for action in unit.Actions:
		var button = Button.new()
		button.text = action.name
		var onclick = func _on_click():
			print("Hello")
			var newAction = action.create()
			unit.cpu.append_instruction(newAction)
			# %Actions.add_child(newAction)
		print("Hello")
		button.pressed.connect(onclick)
		%ActionDefs.add_child(button)
		
func _on_cpu_instructions_changed():
	for instruction in unit.cpu.instructions:
		#%Actions.remove_child(instruction.ui)
		%Actions.add_child(instruction.instance_ui)


func _on_play_pressed() -> void:
	if unit:
		unit.cpu.play()


func _on_reset_pressed() -> void:
	if unit:
		unit.cpu.reset()
