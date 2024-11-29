extends PanelContainer

func _ready() -> void:
	GameManager.selection_mode_changed.connect(_on_selection_mode_changed)

func _on_selection_mode_changed(mode: GameManager.SelectionMode):
	print(mode)
func _on_single_select_pressed() -> void:
	GameManager.set_selection_mode(GameManager.SelectionMode.SINGLE)


func _on_area_select_pressed() -> void:
	GameManager.set_selection_mode(GameManager.SelectionMode.AREA)


func _on_play_pressed() -> void:
	pass # Replace with function body.


func _on_pause_pressed() -> void:
	pass # Replace with function body.
