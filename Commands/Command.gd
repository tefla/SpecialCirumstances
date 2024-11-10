extends Resource
class_name Command

var editor
var unit
var parent_component

signal finished

enum States {
	INIT,
	RUNNING,
	FINISHED,
	ERROR,
}
var state: States = States.INIT

func set_state(newState: States):
	var previous_state = state
	state = newState
	set_highlight()
	
func set_highlight():
	match state:
		States.INIT: 
			editor.modulate = Color.WHITE
		States.RUNNING: 
			editor.modulate = Color.GREEN
		States.FINISHED: 
			editor.modulate = Color.WHITE
		States.ERROR: 
			editor.modulate = Color.RED
