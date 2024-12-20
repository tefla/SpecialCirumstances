extends Task
class_name LaserTask

@export var laser: LaserComponent

func run():
	running()
	await laser.activate()
	laser.deactivate()
	success()
	
