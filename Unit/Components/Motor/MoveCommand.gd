extends Command
class_name MoveCommand



var target_position: Vector2 = Vector2(randi() % 2000 - 1000, randi() % 400 - 200)

func _to_string() -> String:
	return "<MoveCommand: MOVE TO [%s, %s] [Unit: %s, Parent: %s]>" % [target_position.x, target_position.y, unit, parent_component]

func run():
	set_state(States.RUNNING)
	var navAgent:NavigationAgent2D = unit.navigation_agent
	navAgent.target_position = target_position
	await navAgent.navigation_finished
	if navAgent.is_target_reached():
		finished.emit()
		set_state(States.FINISHED)
	else:
		set_state(States.ERROR)		
