extends Task

@export var movable: MovableComponent
var pos: Vector2

func run():
	running()
	var posTask: Task = child_container.get_child(0)
	posTask.run()

func child_success():
	var posTask: Task = child_container.get_child(0)
	pos = posTask.result
	movable.move_to(pos)
	await movable.agent.navigation_finished
	success()
