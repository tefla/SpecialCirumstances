extends Node2D

var selection_started = false
var selection_start: Vector2
var selection_end: Vector2

func _input(event: InputEvent) -> void:
	match GameManager.selection_mode:
		GameManager.SelectionMode.NONE:
			pass
		GameManager.SelectionMode.AREA:
			if event.is_action_pressed("LeftMouseButton") and selection_started == false:
				selection_started = true
				# Start the drag
				selection_start = get_global_mouse_position()
			elif event.is_action_released("LeftMouseButton") and selection_started == true:
				
				selection_started = false
			else:
				selection_end = get_global_mouse_position()
			queue_redraw()
func _draw() -> void:
	if selection_started:
		var width = selection_end.x - selection_start.x
		var height = selection_end.y - selection_start.y
		var selection_rect = Rect2(selection_start.x, selection_start.y, width, height)
		draw_rect(selection_rect, Color.AQUA)
