extends Task

@export var movable: MovableComponent
@export var pos: Vector2

func run():
	running()
	movable.move_to(pos)
	await movable.agent.navigation_finished
	success()
