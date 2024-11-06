extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	GameManager.selection_changed.connect(_on_selection_changed)

func _on_selection_changed():
	if GameManager.selected:
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

	for action in GameManager.selected.Actions:
		var button = Button.new()
		button.text = action.name
		var onclick = func _on_click():
			print("Hello")
			var newAction = action.action_ui.instantiate()
			%Actions.add_child(newAction)
		print("Hello")
		button.pressed.connect(onclick)
		%ActionDefs.add_child(button)
		
